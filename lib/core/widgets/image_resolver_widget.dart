import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageResolverWidget extends StatelessWidget {
  const ImageResolverWidget({
    Key? key,
    required this.uri,
    this.color,
    this.size = 24,
  }) : super(key: key);

  final Uri uri;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final extension = uri.path.split('.').last;
    final isSvg = extension == 'svg';
    final isRemote = uri.isScheme('https');

    if (isSvg) {
      return isRemote
          ? SvgPicture.network(
              uri.toString(),
              color: color,
              height: size,
              width: size,
            )
          : SvgPicture.asset(
              uri.path,
              color: color,
              height: size,
              width: size,
            );
    }

    return isRemote
        ? Image.network(
            uri.toString(),
            color: color,
            height: size,
            width: size,
          )
        : Image.asset(
            uri.path,
            color: color,
            height: size,
            width: size,
          );
  }
}
