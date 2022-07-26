import 'package:flutter/material.dart';
import 'package:zapify/core/ext/context.dart';
import 'package:zapify/features/home/domain/entity/banner.dart';

typedef OnTopBannerActionTap = Function(TopBannerType type);

class TopBanner extends StatefulWidget {
  const TopBanner({
    Key? key,
    required this.type,
    required this.onActionTap,
  }) : super(key: key);

  final TopBannerType type;
  final OnTopBannerActionTap onActionTap;

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> with TickerProviderStateMixin {
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
    final content = _mapContent(context, widget.type);
    return SizeTransition(
      sizeFactor: _animation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: MaterialBanner(
          content: Text(content.contentText),
          leading: Icon(content.icon),
          backgroundColor: content.backgroundColor,
          actions: <Widget>[
            TextButton(
              onPressed: () {
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
    if (type == TopBannerType.appReview) {
      return TopBannerContent(
        icon: Icons.rate_review_outlined,
        contentText: context.strings.homeTopBannerAskToReviewContent,
        buttonText: context.strings.homeTopBannerAskToReviewButton,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
      );
    }
    throw 'Unsupported TopBannerType: $type';
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
