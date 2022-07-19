import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({
    Key? key,
    required this.unitId,
  }) : super(key: key);

  final double height = 60;
  final String unitId;

  @override
  State<StatefulWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _adBanner;

  @override
  void dispose() {
    _adBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.unitId.isEmpty) {
      return const SizedBox(height: 0);
    }

    final adBanner = _initBanner(context);
    final AdWidget adWidget = AdWidget(ad: adBanner);

    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      width: adBanner.size.width.toDouble(),
      height: adBanner.size.height.toDouble(),
      child: adWidget,
    );
  }

  BannerAd _initBanner(BuildContext context) => _adBanner = BannerAd(
        adUnitId: widget.unitId,
        size: _getBannerSize(context),
        request: const AdRequest(),
        listener: const BannerAdListener(),
      )..load();

  // to show full banner in any orientation
  AdSize _getBannerSize(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    final width = [
      windowSize.width,
      windowSize.height,
    ].reduce(min);

    return AdSize(
      width: width.floor(),
      height: widget.height.floor(),
    );
  }
}
