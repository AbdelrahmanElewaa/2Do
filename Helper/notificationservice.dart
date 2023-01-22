import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz2;

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
  Future<int> showNotification({ int? id,  required String title, required String body, required DateTime tod}) async {
    // DateTime now = DateTime.now();
    tz2.initializeTimeZones();
    var ran = Random();
    int idd=ran.nextInt(10000);
     tz.TZDateTime scheduledDate=nextInstanceOfTenAM(tz.TZDateTime.from(
         tod,
         tz.local));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id??idd,
      // id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
      // seconds: 1)),
      scheduledDate,
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
  tz.TZDateTime nextInstanceOfTenAM(tz.TZDateTime time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    if (time.isBefore(now)) {
       time = time.add(const Duration(days: 1));
    }
    return time;
  }
  Future<void> editNotification({ required int id ,  required String title, required String body, required DateTime tod}) async {

    tz2.initializeTimeZones();
    tz.TZDateTime scheduledDate=nextInstanceOfTenAM(tz.TZDateTime.from(
        tod,
        tz.local)) ;
    flutterLocalNotificationsPlugin.cancel(id);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(
      // seconds: 1)),
      scheduledDate,
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
  void deleteNotification(int id){
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
