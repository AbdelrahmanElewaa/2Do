import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();
  // final now = DateTime.now();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {

    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization


    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid);
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body, TimeOfDay tod) async {
    DateTime now = DateTime.now();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
          // seconds: 1)),
      tz.TZDateTime.from(DateTime(now.year, now.month, now.day, tod.hour, tod.minute), tz.local),
      // schedule the notification to show after 2 seconds.
      const NotificationDetails(

        // Android details
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            playSound: true,
            // sound: RawResourceAndroidNotificationSound('ring.wav'),
            importance: Importance.max,
            priority: Priority.max),


      ),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
      true, // To show notification even when the app is closed
    );
  }

  Future<void> editNotification(int oldid,int newid, String title, String body, TimeOfDay tod) async {
    DateTime now = DateTime.now();
    flutterLocalNotificationsPlugin.cancel(oldid);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      newid,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
      // seconds: 1)),
      tz.TZDateTime.from(DateTime(now.year, now.month, now.day, tod.hour, tod.minute), tz.local),
      // schedule the notification to show after 2 seconds.
      const NotificationDetails(

        // Android details
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            playSound: true,
            // sound: RawResourceAndroidNotificationSound('ring.wav'),
            importance: Importance.max,
            priority: Priority.max),


      ),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
      true, // To show notification even when the app is closed
    );
  }

  notificationdetails(){
    const NotificationDetails(

      // Android details
      android: AndroidNotificationDetails('main_channel', 'Main Channel',
          channelDescription: "ashwin",
          playSound: true,
          sound: RawResourceAndroidNotificationSound('pop'),
          importance: Importance.max,
          priority: Priority.max),


    );
}
}
