#!/bin/bash

PROJECT_DIR=$(dirname $(dirname ${BASH_SOURCE[0]}))

set -e

PROJECT_ID=zapfy-f575a
PACKAGE_NAME=${1:-com.zapfy.app.dev}
# use `firebase login:ci` and set `FIREBASE_TOKEN` env variable

PATH=$PATH:$HOME/.local/bin

main() {
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
    if [ -n "$FIREBASE_TOKEN" ]; then
        FIREBASE_TOKEN_ARG="--token $FIREBASE_TOKEN"
    fi

    flutterfire configure -y \
        --project=$PROJECT_ID \
        --out=lib/firebase_options.dart \
        --ios-bundle-id=$PACKAGE_NAME \
        --android-package-name=$PACKAGE_NAME \
        --platforms=android,ios \
        $FIREBASE_TOKEN_ARG

    GSERVICES=$(jq -M "del(.client[]|select(.client_info.android_client_info.package_name!=\"${PACKAGE_NAME}\"))" android/app/google-services.json)
    echo "${GSERVICES}" > android/app/google-services.json
}

main
