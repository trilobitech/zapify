#!/bin/bash

PROJECT_DIR=$(dirname $(dirname ${BASH_SOURCE[0]}))

APP_NAME=$(grep 'name:' $PROJECT_DIR/pubspec.yaml | tail -n1 | awk '{ print $2}')

env | grep -ie "^${APP_NAME}_" | sed -e 's/^/--dart-define /'