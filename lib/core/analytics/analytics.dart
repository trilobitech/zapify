import 'package:zapify/core/analytics/impl/amplitude.dart';
import 'package:zapify/core/analytics/impl/firebase.dart';

import 'composite.dart';
export 'composite.dart';

final Analytics analytics = Analytics([
  FirebaseAnalyticsWrapper(),
  AmplitudeAnalyticsWrapper(),
]);
