# https://stackoverflow.com/a/41020969
# https://stackoverflow.com/a/32704702
if [ ${CONFIGURATION} = "Release" ]; then
    /usr/libexec/PlistBuddy -c "Set :FirebaseCrashlyticsCollectionEnabled YES" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
    /usr/libexec/PlistBuddy -c "Set :firebase_performance_collection_enabled YES" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
    /usr/libexec/PlistBuddy -c "Set :FIREBASE_ANALYTICS_COLLECTION_ENABLED YES" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
fi

if [[ ${CONFIGURATION} = "Debug" || ${IS_FIREBASE_DISTRIBUTION} = "true" ]]; then
    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName \"Zapify Dev\"" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
    /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier \"com.zapfy.app.dev\"" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
fi