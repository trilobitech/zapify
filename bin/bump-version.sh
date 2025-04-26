#!/bin/bash

set -e

PROJECT_DIR=$(dirname $(dirname ${BASH_SOURCE[0]}))

CHANGELOG_PATH="${PROJECT_DIR}/CHANGELOG.md"
PUBSPEC_PATH="${PROJECT_DIR}/pubspec.yaml"
ALLOW_COMMIT_CHANGES=false

CHANGED_FILES=()

sedi="sed -i"
if [ `uname` = 'Darwin' ]; then sedi=sed -i ''; fi

main() {
    current_version=$(get_current_version)

    old_version_name=${current_version%+*}
    old_version_code=${current_version##*+}

    new_version_name=$(get_new_version_name $old_version_name)
    new_version_code=$(get_new_version_code $old_version_code)
    new_release_date=$(get_release_date)

    update_changelog $old_version_name $new_version_name $new_release_date
    update_pubspec   $new_version_name $new_version_code

    if $ALLOW_COMMIT_CHANGES; then
        git commit -m "Release version $new_version_name" ${CHANGED_FILES[*]}
        # git tag "v${new_version_name}"
    fi
}

get_current_version() {
    grep 'version:' $PUBSPEC_PATH | tail -n1 | awk '{ print $2}'
}

get_new_version_code() {
    version_code=$1
    next_version_code=$((version_code+1))

    read -p "Release version code (default: $next_version_code)? " new_version_code
    echo ${new_version_code:-${next_version_code}}
}

get_new_version_name() {
    version_name=$1
    next_version_name=(${version_name//./ })
    next_version_name[1]=$((next_version_name[1]+1))
    next_version_name[2]=0
    next_version_name=$(IFS=. ; echo "${next_version_name[*]}")

    read -p "Release version name (default: $next_version_name)? " new_version_name
    echo ${new_version_name:-${next_version_name}}
}

get_release_date() {
    next_release_date=$(date +%Y-%m-%d)
    read -p "Release date (default: $next_release_date)? " new_release_date
    echo ${new_release_date:-${next_release_date}}
}

update_changelog() {
    current_version=$1
    new_version=$2
    release_date=$3

    $sedi -e "/## \[Unreleased/a \\\n## [$new_version] - $release_date" \
        -e "s/: \(.*\)\(v$current_version\)...HEAD/: \1v$new_version...HEAD\n[$new_version]: \1\2...v$new_version/" \
        $CHANGELOG_PATH

    CHANGED_FILES+=($CHANGELOG_PATH)
}

update_pubspec() {
    version_name=$1
    version_code=$2
    new_version="${version_name}+${version_code}"

    $sedi "s/^version:.*/version: $new_version/" $PUBSPEC_PATH

    CHANGED_FILES+=($PUBSPEC_PATH)
}

# extract arguments
for i in "$@"; do
  case $i in
    --commit-changes)
      ALLOW_COMMIT_CHANGES=true
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
