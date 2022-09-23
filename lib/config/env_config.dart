class EnvConfig {
  static const amplitudeKey = String.fromEnvironment(
    'zapify_amplitudeKey',
    defaultValue: '',
  );
  
  static const homeBannerUnitId = String.fromEnvironment(
    'zapify_homeBannerUnitId',
    defaultValue: '',
  );
  
  static const appStoreId = String.fromEnvironment(
    'zapify_appStoreId',
    defaultValue: '',
  );
}
