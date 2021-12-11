import 'package:firebase_analytics/firebase_analytics.dart';


Future<void> setLogEventUtil({required FirebaseAnalytics? analytics, required String eventName, Map<String,dynamic?>? params}) async {
  await analytics?.logEvent(
      name: eventName,
      parameters: params,
  );
}
Future<void> setCurrentScreenUtil({required FirebaseAnalytics? analytics, required String screenName}) async {
  await analytics?.setCurrentScreen(screenName: screenName);
}

Future<void> setUserIdUtil({required FirebaseAnalytics? analytics, required String userId}) async {
  await analytics?.setUserId(userId);
}