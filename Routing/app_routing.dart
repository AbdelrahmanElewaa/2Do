// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Home/View/home_page.dart';
import '../Notes/View/notes_add.dart';
import '../Tasks/Domain/AddTask.dart';
import '../Tasks/Domain/SharedTasksModel.dart';
import '../Tasks/Domain/TasksModel.dart';
import '../Shared/View/start.dart';
import '../Shared/View/splashscreen.dart';
import '../User/View/account.dart';
import '../User/View/login.dart';
import '../Notes/View/notes_details.dart';
import '../User/View/settings.dart';
import '../User/View/signup.dart';
import '../Statistics/View/stat.dart';

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
          name: "notesdetails",
          path: 'notesdetails/:title/:content/:id',
          builder: (BuildContext context, GoRouterState state) => NotesDetails(
              title: state.params["title"]!,
              content: state.params["content"]!,
              id: state.params["id"]!),
        ),
        GoRoute(
          path: 'notesadd',
          builder: (BuildContext context, GoRouterState state) => NotesAdd(),
        ),
        GoRoute(
          path: 'home/:selectedIndex',
          name: 'home',
          builder: (context, state) => HomePage(
            selectedIndex: int.parse(state.params["selectedIndex"]!),
          ),
        ),
        GoRoute(
          path: 'sharedtasks',
          builder: (BuildContext context, GoRouterState state) =>
              SharedTodoList(),
        ),
      ],
    ),
  ],
);
