import 'dart:io';

const _homeAdListAndroidUnitId = String.fromEnvironment(
  'ZAPIFY_HOME_AD_LIST_ANDROID_UNIT_ID',
  defaultValue: '',
);
const _homeAdListIosUnitId = String.fromEnvironment(
  'ZAPIFY_HOME_AD_LIST_IOS_UNIT_ID',
  defaultValue: '',
);

class EnvConfig {
  static const amplitudeKey = String.fromEnvironment(
    'ZAPIFY_AMPLITUDE_KEY',
    defaultValue: '',
  );

  static const homeBannerUnitId = String.fromEnvironment(
    'ZAPIFY_HOME_BANNER_UNIT_ID',
    defaultValue: '',
  );

  static String get homeAdListUnitId {
    if (Platform.isAndroid) return _homeAdListAndroidUnitId;
    if (Platform.isIOS) return _homeAdListIosUnitId;
    return '';
  }

  static const appStoreId = String.fromEnvironment(
    'ZAPIFY_APP_STORE_ID',
    defaultValue: '',
  );
}
