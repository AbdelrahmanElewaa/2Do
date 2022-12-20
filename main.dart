// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/Tasks/Data/TaskDataHive.dart';
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
        splashColor: Color(0xFF000000),
        secondaryHeaderColor: Color.fromARGB(255, 94, 94, 94),
        primaryColor: Color(0xFFF9F9F9),
        scaffoldBackgroundColor: Color(0xFFE5E5E5),
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

void main() async{
  // init the hive
  await Hive.initFlutter();

  // open a box
  Hive.registerAdapter(TodoHiveAdapter());
  await Hive.openBox<TodoHive>('todobox');
  // var box = await Hive.openBox('todobox');
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(ProviderScope(child: TodoApp()));
}
