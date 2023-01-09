import 'package:analytics/analytics.dart';
import 'package:bloc_plus/bloc_plus.dart';
import 'package:flutter/material.dart';

import '../../../../../common/di/inject.dart';
import '../../../../../common/ext/context.dart';
import '../domain/entity/top_banner.dart';
import 'top_banner_bloc.dart';
import 'top_banner_state.dart';

typedef OnTopBannerActionTap = Function(TopBannerType type);

class TopBannerWidget extends StatelessWidget
    with StateMixin<TopBannerBloc, TopBannerState> {
  TopBannerWidget({Key? key}) : super(key: key);

  @override
  late final bloc = inject<TopBannerBloc>();

  @override
  Widget buildState(BuildContext context, TopBannerState state) {
    return state.when(
      (type) => _TopBannerView(
        type: type,
        onActionTap: (type) {
          context.read<TopBannerBloc>().onTopBannerActionTap(type);
        },
      ),
      none: () => Container(),
    );
  }
}

class _TopBannerView extends StatefulWidget {
  const _TopBannerView({
    Key? key,
    required this.type,
    required this.onActionTap,
  }) : super(key: key);

  final TopBannerType type;
  final OnTopBannerActionTap onActionTap;

  @override
  State<_TopBannerView> createState() => _TopBannerViewState();
}

class _TopBannerViewState extends State<_TopBannerView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    // TODO: fix animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    analytics.logEvent(
      'top_banner_viewed',
      properties: {'banner_type': widget.type.name},
    );
    final content = _mapContent(context, widget.type);
    return SizeTransition(
      sizeFactor: _animation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: MaterialBanner(
          content: Text(content.contentText),
          leading: Icon(content.icon, size: 18),
          backgroundColor: content.backgroundColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                analytics.buttonPressed(content.buttonText);
                _controller.reverse();
                widget.onActionTap(widget.type);
              },
              child: Text(content.buttonText),
            ),
          ],
        ),
      ),
    );
  }

  TopBannerContent _mapContent(BuildContext context, TopBannerType type) {
    switch (type) {
      case TopBannerType.appReview:
        return TopBannerContent(
          icon: Icons.rate_review_outlined,
          contentText: context.strings.homeTopBannerAskToReviewContent,
          buttonText: context.strings.homeTopBannerAskToReviewButton,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        );
    }
  }
}

class TopBannerContent {
  const TopBannerContent({
    required this.icon,
    required this.contentText,
    required this.buttonText,
    required this.backgroundColor,
  });

  final IconData icon;
  final String contentText;
  final String buttonText;
  final Color backgroundColor;
}
