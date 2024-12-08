import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/view/notification_screen.dart';

Future<void> handleBackgroundMessageHandler(RemoteMessage message) async {
  print('Title : ${message.notification!.title}');
  print('Body : ${message.notification!.body}');
  print('Payload : ${message.data}');
}

class NotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<String> getDeviceToken() async {
    String? token = await _firebaseMessaging.getToken();
    return token!;
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // navigatorKey.currentState
    //     ?.pushNamed(NotificationScreen.route, arguments: message);
  }

  Future initLocalNotifcation() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');

    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
          handleMessage(message);
        }
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessageHandler);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');

    initPushNotifications();
    initLocalNotifcation();
  }

  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  // void initLocalNotifcation(BuildContext context, RemoteMessage message) async {
  //   var androidInitialization =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher.png');
  //   // var iosInitialization = const DarwinInitializationSettings();
  //   var initializationSetting = InitializationSettings(
  //     android: androidInitialization,
  //     // iOS: iosInitialization
  //   );

  //   await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
  //       onDidReceiveBackgroundNotificationResponse: (payLoad) {});
  // }

  // void requestNotification() async {
  //   NotificationSettings settings = await messaging.requestPermission(
  //       alert: true,
  //       announcement: true,
  //       badge: true,
  //       criticalAlert: true,
  //       sound: true);

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print("user granted permission");
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print("user granted provisional permission");
  //   } else {
  //     AppSettings.openAppSettings();
  //     print("user denied permission");
  //   }
  // }

  // void firebaseInit() {
  //   FirebaseMessaging.onMessage.listen((message) {
  //     if (kDebugMode) {
  //       print(message.notification!.title.toString());
  //       print(message.notification!.body.toString());
  //     }
  //     showNotification(message);
  //   });
  // }

  // Future<void> showNotification(RemoteMessage message) async {
  //   AndroidNotificationChannel channel = AndroidNotificationChannel(
  //       Random.secure().nextInt(100000).toString(),
  //       "High Importance Notification",
  //       importance: Importance.high);

  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails(
  //     channel.id.toString(),
  //     channel.name.toString(),
  //     channelDescription: "your channel description",
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     ticker: "ticker",
  //   );

  //   // DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
  //   //   presentAlert: true,
  //   //   presentBadge: true,
  //   //   presentSound: true,
  //   // );

  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //     // iOS: darwinNotificationDetails
  //   );
  //   Future.delayed(Duration.zero, () {
  //     _flutterLocalNotificationsPlugin.show(
  //         0,
  //         message.notification!.title.toString(),
  //         message.notification!.body.toString(),
  //         notificationDetails);
  //   });
  // }

  // void isTokenRefresh() async {
  //   messaging.onTokenRefresh.listen((event) {
  //     event.toString();
  //     print("refresh");
  //   });
  // }
}
