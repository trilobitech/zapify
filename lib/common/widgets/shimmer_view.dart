import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFD6D6D6),
      highlightColor: Colors.grey.shade200,
      child: ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 4, tileMode: TileMode.decal), child: child),
    );
  }
}
