import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../../../common/di/inject.dart';
import 'ad_banner_bloc.dart';
import 'ad_banner_state.dart';

class AdBannerWidget extends StatelessWidget
    with StateMixin<AdBannerBloc, AdBannerState> {
  AdBannerWidget({super.key});

  @override
  late final bloc = inject<AdBannerBloc>();

  @override
  Widget buildState(BuildContext context, AdBannerState state) =>
      switch (state) {
        LoadedAdBannerState(:final unitId) => _AdBannerWidget(unitId: unitId),
        NoneAdBannerState() => const SizedBox.shrink(),
      };
}

class _AdBannerWidget extends StatefulWidget {
  const _AdBannerWidget({required this.unitId});

  final double height = 60;
  final String unitId;

  @override
  State<StatefulWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<_AdBannerWidget> {
  BannerAd? _adBanner;

  @override
  void dispose() async {
    super.dispose();
    await _adBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adBanner = _initBanner(context);
    final adWidget = AdWidget(ad: adBanner);

    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      width: adBanner.size.width.toDouble(),
      height: adBanner.size.height.toDouble(),
      child: adWidget,
    );
  }

  BannerAd _initBanner(BuildContext context) =>
      _adBanner = BannerAd(
        adUnitId: widget.unitId,
        size: _getBannerSize(context),
        request: const AdRequest(),
        listener: const BannerAdListener(),
        // ignore: discarded_futures
      )..load();

  // to show full banner in any orientation
  AdSize _getBannerSize(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    final width = [windowSize.width, windowSize.height].reduce(min);

    return AdSize(width: width.floor(), height: widget.height.floor());
  }
}
