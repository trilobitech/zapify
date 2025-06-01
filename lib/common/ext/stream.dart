import 'dart:async';

import 'package:rxdart/rxdart.dart';

extension CompositeSubscriptionX on CompositeSubscription {
  void addAll(List<StreamSubscription> subscriptions) {
    subscriptions.forEach(add);
  }
}
