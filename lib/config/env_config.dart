class EnvConfig {
  static const amplitudeKey = String.fromEnvironment(
    'ZAPIFY_AMPLITUDE_KEY',
    defaultValue: '',
  );

  static const homeBannerUnitId = String.fromEnvironment(
    'ZAPIFY_HOME_BANNER_UNIT_ID',
    defaultValue: '',
  );

  static const appStoreId = String.fromEnvironment(
    'ZAPIFY_APP_STORE_ID',
    defaultValue: '',
  );
}
