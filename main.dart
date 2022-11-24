// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/Model/TasksModel.dart';
import 'package:todo/Model/start.dart';
import 'package:todo/Model/taskDescription.dart';
import 'package:todo/Widgets/splashscreen.dart';
import 'package:todo/Model/AddTask.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/login.dart';
import 'package:todo/pages/settings.dart';
import 'package:todo/pages/account.dart';
import 'package:todo/pages/signup.dart';
import 'package:todo/pages/stat.dart';
import 'package:todo/pages/notes_details.dart';
import 'package:go_router/go_router.dart';

class TodoApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => start(),
        routes: <GoRoute>[
          GoRoute(
            path: 'addtask',
            builder: (BuildContext context, GoRouterState state) => AddTask(),
          ),
          GoRoute(
            path: 'stat',
            builder: (BuildContext context, GoRouterState state) => Stat(),
          ),
          GoRoute(
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) => Settings(),
          ),
          GoRoute(
            path: 'account',
            builder: (BuildContext context, GoRouterState state) => Account(),
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) => LoginPage(),
          ),
          GoRoute(
            path: 'signup',
            builder: (BuildContext context, GoRouterState state) =>
                SignupPage(),
          ),
          GoRoute(
            path: 'TodoList',
            builder: (BuildContext context, GoRouterState state) => TodoList(),
          ),
          GoRoute(
            path: 'splash',
            builder: (BuildContext context, GoRouterState state) =>
                SplashScreen(),
          ),
          GoRoute(
            path: 'notesdetails',
            builder: (BuildContext context, GoRouterState state) =>
                NotesDetails(),
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo list',
      // home: TodoList(),
// >>>>>>> Stashed changes

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 243, 240, 241),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
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

void main() => runApp(TodoApp());
