import 'dart:math';

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
        InitializationSettings(android: initializationSettingsAndroid);
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
// {}
  Future<int> showNotification({ int? id,  required String title, required String body, required TimeOfDay tod}) async {
    DateTime now = DateTime.now();
    var ran = Random();
    int idd=ran.nextInt(10000);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id??idd,
      // id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
      // seconds: 1)),
      tz.TZDateTime.from(
          DateTime(now.year, now.month, now.day, tod.hour, tod.minute),
          tz.local),
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
    return idd;
  }

  Future<void> editNotification({ required int id ,  required String title, required String body, required TimeOfDay tod}) async {
    DateTime now = DateTime.now();
    flutterLocalNotificationsPlugin.cancel(id);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
      // seconds: 1)),
      tz.TZDateTime.from(
          DateTime(now.year, now.month, now.day, tod.hour, tod.minute),
          tz.local),
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

  notificationdetails() {
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
