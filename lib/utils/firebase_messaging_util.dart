import 'dart:developer';

import '../headers.dart';

class FirebaseMessagingUtil {
  FirebaseMessagingUtil._();
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // static final NotificationController _notificationController = Get.find();

  static Future<void> init() async {
    await _initFbNotifications();
    // Set up Firebase Cloud Messaging listeners
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    //   // Handle incoming message when the app is in the foreground.
    //   if (kDebugMode) {
    //     log("Foreground onMessage title: ${message.notification?.title}");
    //     log("Foreground onMessage body: ${message.notification?.body}");
    //     log("Foreground onMessage data: ${message.data}");
    //   }
    //   // NotificationHelper.saveNotification(message);
    //   // Prefs.saveNotification(message.notification?.body ?? '');
    //   if (message.notification != null) {
    //     //! Uncomment
    //     // await NotificationHelper.showNotification(
    //     //   message.notification?.title ?? '',
    //     //   message.notification?.body ?? '',
    //     // );
    //     print("UTILITY SAVE CALLED");
    //     // final notification = NotificationModel(
    //     //   title: message.notification?.title ?? 'No Title',
    //     //   body: message.notification?.body ?? 'No Body',
    //     //   receivedAt: DateTime.now(),
    //     //   data: message.data,
    //     // );
    //     // debugPrint("Adding in Screen");
    //     // _notificationController.addNotification(notification);
    //     // await NotificationService().saveBackgroundNotification(message);
    //   }
    //   // You can implement custom logic to handle the foreground message.
    // });
  }

  static _initFbNotifications() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final token = await _fcm.getToken(
        vapidKey:
            "BBJV9za6iNMgSrvj7H9G-mq-yhfkuTd_1OvGylpo0U0fiw63KBIPOEsELYBhJSqexopt7d9etIiW5m_6134ClFs");
    print("FCM Token: $token");
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
      // AppSettings.openAppSettings(type: AppSettingsType.notification);
    }

    // var result = await FlutterNotificationChannel().registerNotificationChannel(
    //   description: Strings.notificationChannelDescription,
    //   id: 'chats',
    //   importance: NotificationImportance.IMPORTANCE_HIGH,
    //   name: 'Chats',
    // );
    // log(result);
  }

  static void isTokenRefresh() {
    _fcm.onTokenRefresh.listen((token) async {
      log("FCM TOken Refreshed: ${token.toString()}");
      // await OfficersApi.saveFirebaseToken(fcmToken: token);
    });
  }
}
