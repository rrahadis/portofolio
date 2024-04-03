import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalytic {
  void logEvent(String variable) async {
    await FirebaseAnalytics.instance.logEvent(
      name: variable,
    );
  }
}
