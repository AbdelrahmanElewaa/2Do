// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Model/AddTask.dart';
import '../Model/TasksModel.dart';
import '../Model/start.dart';
import '../Widgets/splashscreen.dart';
import '../view/account.dart';
import '../view/home_page.dart';
import '../view/login.dart';
import '../view/notes_details.dart';
import '../view/settings.dart';
import '../view/signup.dart';
import '../view/stat.dart';

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
          builder: (BuildContext context, GoRouterState state) => SignupPage(),
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
        GoRoute(
          path: 'home/:selectedIndex',
          name: 'home',
          builder: (context, state) => HomePage(
            selectedIndex: int.parse(state.params["selectedIndex"]!),
          ),
        ),
      ],
    ),
  ],
);
