// import 'dart:math';



// import '../headers.dart';

// class NotificationHelper {
//   NotificationHelper._();
//   // static final _jsonApi = ApiConfig.notifyJsonApi;
//   static FirebaseMessaging fmessaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _notificationPlugin =
//       FlutterLocalNotificationsPlugin();
//   static Future<void> getFirebaseMessagingToken() async {
//     await fmessaging.requestPermission();
//     await fmessaging.getToken().then(
//           (t) => {
//             // if (t != null) me.pushToken = t,
//             print('Push Token: $t'),
//           },
//         );
//   }

//   static Future<void> clearNotify() async {
//     await fmessaging.deleteToken();
//     // LocalStorage.removeUserInfo();
//   }

//   static Future<void> showNotification(String title, String body) async {
//     AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       'chats',
//       'Chats',
//       description: Strings.notificationChannelDescription,
//       importance: Importance.max,
//     );

//     AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       importance: channel.importance,
//       priority: Priority.max,
//       ticker: "ticker",
//     );
    

//     DarwinNotificationDetails iOS = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iOS);
//     Random random = Random();
//     int notifyId = random.nextInt(100000);
//     print('Notification ID: $notifyId');
//     await _notificationPlugin.show(notifyId, title, body, notificationDetails);
//   }

//   static Future<void> setUpInteractMessage() async {
//     RemoteMessage? initMsg =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initMsg != null) {
//       _handleMessage(initMsg);
//     }

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Handle notification when the app is opened from a terminated state.
//       if (kDebugMode) {
//         print("Foreground onMessageOpenedApp: ${message.notification?.title}");
//         print("Foreground onMessageOpenedApp: ${message.notification?.body}");
//         print("Foreground onMessageOpenedApp: ${message.data}");
//       }
//       _handleMessage(message);
//     });
//   }

//   static Future<String> getFcmToken() async {
//     fmessaging.requestPermission();
//     return await fmessaging.getToken() ?? '';
//   }

//   static void initializeNotification(RemoteMessage msg) async {
//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initializationSettingsIOS = DarwinInitializationSettings();

//     InitializationSettings initializationSettings =
//         const InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await _notificationPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse? response) {
//       _handleMessage(msg);
//     });
//   }

//   // static Future<bool> _sendNotificationApi(
//   //     {required String title,
//   //     required String msgBody,
//   //     required String token}) async {
//   //   try {
//   //     const apiEndpoint = '/send';
//   //     final body = {
//   //       'notification': {
//   //         'title': title,
//   //         'body': msgBody,
//   //         "android_channel_id": "chats"
//   //       },
//   //       'priority': 'high',
//   //       'data': {
//   //         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//   //         'id': '1',
//   //         'status': 'done'
//   //       },
//   //       'to': token
//   //     };
//   //     final res = await _jsonApi.post(apiEndpoint, data: jsonEncode(body));
//   //     if (res.statusCode == ApiConfig.success) {
//   //       print('Message: ${res.data}');
//   //       // print('${res.data.runtimeType}');
//   //       return true;
//   //     } else {
//   //       print('Send Notification failed');
//   //       return false;
//   //     }
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return false;
//   //   }
//   // }

//   // static Future<void> sendPushNotification() async {
//   //   const String body = "Hello from Notification";
//   //   final String token = await getFcmToken();
//   //   // if (await _sendNotificationApi(
//   //   //     title: "title", msgBody: body, token: token)) {
//   //   //   print('Notification Sent');
//   //   // } else {
//   //   //   print('Notification Failed');
//   //   // }
//   //   // var url = Uri.https('example.com', 'whatsit/create');
//   //   // try {
//   //   //   final body = {
//   //   //     'notification': {
//   //   //       'title': title,
//   //   //       'body': msgBody,
//   //   //       "android_channel_id": "chats"
//   //   //     },
//   //   //     'priority': 'high',
//   //   //     'data': {
//   //   //       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//   //   //       'id': '1',
//   //   //       'status': 'done'
//   //   //     },
//   //   //     'to': token
//   //   //   };
//   //   //   var res = await post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
//   //   //       body: jsonEncode(body),
//   //   //       headers: {
//   //   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //   //         HttpHeaders.authorizationHeader:
//   //   //             'key=AAAAWY6Y6f4:APA91bG9QycyfUxErXiQmDYEA1M0TOYlwrmL1urAkkjZl4hjz2z1VKdXi_oCp9-b9CCbSNDs8GojZE5mBBkmyY8-NdU4paejIYeXyivyAmHOgoCL2XhHk8O8mOfiwoB5SmMNdVnHPnKQ',
//   //   //       });
//   //   //   print('Response status: ${res.statusCode}');
//   //   //   print('Response body: ${res.body}');
//   //   // } catch (e) {
//   //   //   print('\nSendNotificationErr: $e');
//   //   // }
//   // }

//   // static Future<void> getSelfInfo() async {
//   //   await firestore.collection('users').doc(user.uid).get().then((user) async {
//   //     if (user.exists) {
//   //       me = ChatUser.fromJson(user.data()!);
//   //       await getFirebaseMessagingToken();
//   //       //!For Updating User Status to Active
//   //       APIs.updateActiveStatus(true);
//   //     } else {
//   //       await createUser().then((value) => getSelfInfo());
//   //     }
//   //   });
//   // }

//   // static Future<void> saveNotification(RemoteMessage message) async {
//   //   await Prefs.saveNotification(message.data.toString());
//   // }

//   // static Future<List<String>> getNotifications() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   final notifications = prefs.getStringList('notifications') ?? [];
//   //   return notifications;
//   // }
//   static void _handleMessage(RemoteMessage message) {
//     print('Notification Received: ${message.data}');
//     // Routes.getAdminAssginedRoutes();
//     if (message.data.isNotEmpty) {
//       print("ShiftId from notification: ${message.data['shiftId']}");
//       final event =
//           ShiftEvent.values.firstWhere((e) => e.value == message.data['Event']);
//       event.redirectUser(message.data['shiftId']);
//     }
//   }
// }
