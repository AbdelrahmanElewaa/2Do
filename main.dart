// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Routing/app_routing.dart';
import 'helper/notificationservice.dart';

class TodoApp extends StatelessWidget {
  //* Application routing

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo list',
      // builder: ,
      // home: TodoList(),
      // builder: (context, widget) => SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //* Application colors
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
        colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 71, 181, 255)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(TodoApp());
}
