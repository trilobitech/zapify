import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zapfy/features/home/domain/entity/icon.dart';

class RawIconWidget extends StatelessWidget {
  const RawIconWidget({
    Key? key,
    required this.icon,
    this.color,
    this.size = 24,
  }) : super(key: key);

  final RawIcon icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (icon is RawIconData) {
      return Icon(
        IconData(
          (icon as RawIconData).codePoint,
          fontFamily: 'MaterialIcons',
        ),
        color: color,
        size: size,
      );
    }
    if (icon is RawIconUrl) {
      return _buildIconFromUri((icon as RawIconUrl).uri);
    }
    throw UnsupportedError('Icon type "${icon.runtimeType}" not supported');
  }

  Widget _buildIconFromUri(Uri uri) {
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
