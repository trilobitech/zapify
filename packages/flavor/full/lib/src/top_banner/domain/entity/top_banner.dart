enum TopBannerType {
  appReview;

  factory TopBannerType.fromString(String key) {
    for (final type in TopBannerType.values) {
      if (type.name == key) {
        return type;
      }
    }
    throw ArgumentError('`TopBannerType` == "$key" not valid');
  }
}
