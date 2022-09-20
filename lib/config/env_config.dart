class EnvConfig {
  static const amplitudeKey = String.fromEnvironment(
    'zapify_amplitudeKey',
    defaultValue: '',
  );
  
  static const homeBannerUnitId = String.fromEnvironment(
    'zapify_homeBannerUnitId',
    defaultValue: '',
  );
}
