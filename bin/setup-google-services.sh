#!/bin/bash

set -e

PROJECT_DIR=$(dirname $(dirname ${BASH_SOURCE[0]}))

PATH=$PATH:$HOME/.local/bin

main() {
    check_args
    install_deps
    configure
}


# install firebase_cli and flutterfire_cli if needed
install_deps() {
    if ! command -v firebase &> /dev/null; then
        curl -sL https://firebase.tools | sed 's/\/usr\//~\/./' | bash
    fi
    if [[ -z "$FIREBASE_TOKEN" && $(firebase login:list -j | jq '.result|length') -eq 0 ]]; then
        echo "Signing to Firebase CLI..."
        firebase login
    fi
    if ! command -v flutterfire &> /dev/null; then
        dart pub global activate flutterfire_cli
    fi
}

# Creating files:
# android/app/google-services.json ios/Runner/GoogleService-Info.plist ios/firebase_app_id_file.json lib/firebase_options.dart
configure() {
    # use `firebase login:ci` and set `FIREBASE_TOKEN` env variable for CI usage
    if [ -n "$FIREBASE_TOKEN" ]; then
        FIREBASE_TOKEN_ARG="--token $FIREBASE_TOKEN"
    fi

    flutterfire configure -y \
        --project=$FIREBASE_PROJECT_ID \
        --out=lib/firebase_options.dart \
        --ios-bundle-id=$IOS_BUNDLE_ID \
        --android-package-name=$ANDROID_PACKAGE_NAME \
        --platforms=android,ios \
        $FIREBASE_TOKEN_ARG

    GSERVICES=$(jq -M "del(.client[]|select(.client_info.android_client_info.package_name!=\"${ANDROID_PACKAGE_NAME}\"))" android/app/google-services.json)
    echo "${GSERVICES}" > android/app/google-services.json
}

check_args() {
    if [[ -z "${FIREBASE_PROJECT_ID}" || -z "${ANDROID_PACKAGE_NAME}" || -z "${IOS_BUNDLE_ID}"  ]]; then
        echo -e "Usage:\n\n$0 --project-id=[PROJECT-ID] --android-package-name=[PACKAGE-NAME] --ios-bundle-id=[BUNDLE-ID]\n"
        exit 1
    fi
}

# extract arguments
for i in "$@"; do
  case $i in
    --project-id=*)
      FIREBASE_PROJECT_ID="${i#*=}"
      shift
      ;;
    --android-package-name=*)
      ANDROID_PACKAGE_NAME="${i#*=}"
      shift
      ;;
    --ios-bundle-id=*)
      IOS_BUNDLE_ID="${i#*=}"
      shift
      ;;
    -*|--*)
      echo "Unknown option '$i'"
      exit 1
      ;;
    *)
      ;;
  esac
done

main
