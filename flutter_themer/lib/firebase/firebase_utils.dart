import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_themer/utils/logger.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);

Future<void> fbLogEvent(
    {required String name, Map<String, dynamic>? parameters}) async {
  logD('Logging Event: $name, $parameters');
  if (null == parameters) {
    await FirebaseAnalytics.instance.logEvent(name: name.toLowerCase());
    return;
  }
  await FirebaseAnalytics.instance.logEvent(
    name: name.toLowerCase(),
    parameters: parameters,
  );
}
