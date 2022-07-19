import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({
    Key? key,
    required this.unitId,
    required this.windowSize,
  }) : super(key: key);

  final String unitId;
  final Size windowSize;

  @override
  State<StatefulWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _adBanner;

  @override
  void initState() {
    if (widget.unitId.isNotEmpty) {
      _adBanner = _initBanner();
    }
    super.initState();
  }

  @override
  void dispose() {
    _adBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adBanner = _adBanner;
    if (adBanner == null) return Container();

    final AdWidget adWidget = AdWidget(ad: adBanner);

    return Center(
      child: Container(
        alignment: Alignment.center,
        width: adBanner.size.width.toDouble(),
        height: adBanner.size.height.toDouble(),
        child: adWidget,
      ),
    );
  }

  BannerAd _initBanner() => BannerAd(
        adUnitId: widget.unitId,
        size: AdSize(
          height: 50,
          width: _getBannerWidth(),
        ),
        request: const AdRequest(),
        listener: const BannerAdListener(),
      )..load();

  // to show full banner in any orientation
  int _getBannerWidth() {
    final windowSize = widget.windowSize;
    return [
      windowSize.width,
      windowSize.height,
    ].reduce(min).floor();
  }
}
