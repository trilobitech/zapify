abstract class RawIcon {}

class RawIconData extends RawIcon {
  RawIconData(this.codePoint);

  int codePoint;
}

class RawIconUrl extends RawIcon {
  RawIconUrl(String uri) : uri = Uri.parse(uri);

  Uri uri;
}
