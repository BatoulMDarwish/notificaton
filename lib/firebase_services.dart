import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> initialize() async {
    String? token = await _fcm.getToken();
    print("my token $token");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // display the notification in the UI
      }
    });
  }
}