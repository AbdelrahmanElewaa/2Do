// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/Model/TasksModel.dart';
import 'package:todo/Widgets/splashscreen.dart';
import 'package:todo/Model/AddTask.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/login.dart';
import 'package:todo/pages/settings.dart';
import 'package:todo/pages/account.dart';
import 'package:todo/pages/signup.dart';

import 'package:todo/pages/stat.dart';
import 'package:go_router/go_router.dart';

class TodoApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //   rgb(10, 145, 171)
        primarySwatch: Colors.amber,
        // Color.fromRGBO(10, 145, 171, 1)
        // canvasColor: Color.fromRGBO(10, 145, 171, 1),
        // accentColor: Color.fromRGBO(r, g, b, opacity),
        // primaryColor: Color.fromRGBO(10, 145, 171, 1),
        // splashColor: Color.fromRGBO(10, 145, 171, 1),
      ),
      // theme: ,
      // color: Colors.amber,
    );
  }
}

void main() => runApp(TodoApp());
