import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logify/logify.dart';

import '../ext/context.dart';
import '../widgets/list_divider.dart';

const _nativeAdMinHeight = 90.0;
const _nativeAdMaxHeight = 90.0;

class AdListViewSeparatorBuilder {
  AdListViewSeparatorBuilder({
    this.everyNthItem = 4,
    this.unitId = '',
    this.defaultDivider = const ListDivider(),
  });

  final int everyNthItem;
  final String unitId;
  final Widget defaultDivider;

  Widget call(BuildContext context, int index) {
    if (unitId.isNotEmpty &&
        everyNthItem > 1 &&
        index % everyNthItem == everyNthItem - 1) {
      return _NativeAdListSeparatorFrame(
        child: _NativeAdListSeparator(key: UniqueKey(), adUnitId: unitId),
      );
    }
    return defaultDivider;
  }
}

class _NativeAdListSeparatorFrame extends StatelessWidget {
  const _NativeAdListSeparatorFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.grey.withValues(alpha: 0.2),
          constraints: BoxConstraints(
            minWidth: constraints.minWidth > 0 ? constraints.minWidth : 320.0,
            minHeight: _nativeAdMinHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: _nativeAdMaxHeight,
          ),
          child: child,
        );
      },
    );
  }
}

/// https://developers.google.com/admob/flutter/native
class _NativeAdListSeparator extends StatefulWidget {
  const _NativeAdListSeparator({super.key, required this.adUnitId});

  final String adUnitId;

  @override
  State<_NativeAdListSeparator> createState() => _NativeAdListSeparatorState();
}

class _NativeAdListSeparatorState extends State<_NativeAdListSeparator> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  String get _adUnitId => widget.adUnitId;

  /// Loads a native ad.
  void loadAd() async {
    final nativeAd = NativeAd(
      adUnitId: _adUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          Log.d('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) async {
          Log.e('$NativeAd failed to load', error);
          await ad.dispose();
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.small,
      ),
    );

    try {
      await nativeAd.load();
      _nativeAd = nativeAd;
    } catch (error, stack) {
      if (kDebugMode &&
          error is PlatformException &&
          error.message?.startsWith('Ad for following adId already exists: ') ==
              true) {
        // workaround for the issue with the hot reload: https://github.com/googleads/googleads-mobile-flutter/issues/78
        await Future.delayed(const Duration(seconds: 1));
        return loadAd();
      }
      Log.e('NativeExample loadAd error: $error', error, stack);
    }
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  void didUpdateWidget(covariant _NativeAdListSeparator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.key != widget.key) {
      unawaited(_nativeAd?.dispose());
      _nativeAd = null;
      _nativeAdIsLoaded = false;
      loadAd();
    }
  }

  @override
  void dispose() {
    unawaited(_nativeAd?.dispose());
    _nativeAd = null;
    _nativeAdIsLoaded = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nativeAd = _nativeAd;

    if (!_nativeAdIsLoaded || nativeAd == null) {
      return Center(
        child: Text(
          context.strings.advertisementPlaceholder,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return AdWidget(ad: nativeAd);
  }
}
