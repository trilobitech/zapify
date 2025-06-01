import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logify/logify.dart';

class ImageResolverWidget extends StatelessWidget {
  ImageResolverWidget({
    super.key,
    required this.uri,
    this.color,
    this.height,
    this.width,
  });

  factory ImageResolverWidget.icon({
    Key? key,
    required Uri uri,
    Color? color,
    double size = 24,
  }) => ImageResolverWidget(
    key: key,
    uri: uri,
    color: color,
    height: size,
    width: size,
  );

  factory ImageResolverWidget.illustration({
    Key? key,
    required Uri uri,
    Color? color,
    double size = 128,
  }) => ImageResolverWidget(
    key: key,
    uri: uri,
    color: color,
    height: size,
    width: size,
  );

  final Uri uri;
  final Color? color;
  final double? height;
  final double? width;

  late final _extension = uri.path.split('.').last;
  late final _isSvg = _extension == 'svg';
  late final _colorFilter =
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

  @override
  Widget build(BuildContext context) {
    switch (uri.scheme) {
      case 'https':
        return _fromNetwork();
      case 'assets':
        Log.w(
          'Asset "$uri" are using deprecated scheme, '
          'please change to "asset://"',
        );
        return _fromAssets();
      case 'asset':
        return _fromAssets();
      default:
        Log.e('Unsupported scheme: "${uri.scheme}"');
        return Container();
    }
  }

  Widget _fromNetwork() {
    final color = this.color;
    return _isSvg
        ? SvgPicture.network(
          '$uri',
          height: height,
          width: width,
          colorFilter: _colorFilter,
        )
        : Image.network('$uri', color: color, height: height, width: width);
  }

  Widget _fromAssets() {
    final package = uri.host != 'main' ? uri.host : null;
    return _isSvg
        ? SvgPicture.asset(
          uri.path,
          package: package,
          height: height,
          width: width,
          colorFilter: _colorFilter,
        )
        : Image.asset(
          uri.path,
          package: package,
          color: color,
          height: height,
          width: width,
        );
  }
}
