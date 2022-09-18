class EnvConfig {
  static const amplitudeKey = String.fromEnvironment(
    'env.amplitudeKey',
    defaultValue: '',
  );
  
  static const homeBannerUnitId = String.fromEnvironment(
    'env.homeBannerUnitId',
    defaultValue: '',
  );
}
