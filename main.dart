// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart' as p;
import 'package:todo/consts/theme_data.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'Routing/app_routing.dart';
import 'helper/notificationservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'consts/theme_data.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  //* Application routing
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  //initState is called before the build method
  //build method is a method that builds the widget
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MultiProvider is a widget that provides and merge multiple providers at once
    return MultiProvider(
      providers: [
        // (_) is a constructor for the ChangeNotifierProvider which is used in DarkThemeProvider class
        //changeNotifierProvider is a provider that provides a ChangeNotifier
        // create: (_) => DarkThemeProvider() is a function that creates a DarkThemeProvider
        //p is a prefix for the provider package
        p.ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      // Consumer is a widget that consumes a provider
      //builder: (context, themeProvider, child) is a builder that builds the MaterialApp
      //Builder function is a function that builds the MaterialApp which is a widget that provides the theme
      // To make the material app listen we have to make a wrapper around it so it can listen to the changes
      child: p.Consumer<DarkThemeProvider>(
          builder: (context, themeProvider, child) {
        return MaterialApp.router(
          theme: Styles.themeData(themeProvider.getDarkTheme),
          routerConfig: router,
          title: 'Todo list',
          // builder: , 
          // home: TodoList(),
          // builder: (context, widget) => SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}



void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // var box = await Hive.openBox('todobox');
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService().initNotification();

  runApp(ProviderScope(child: TodoApp()));
}
