import 'package:flutter/material.dart';
import 'package:todo/Model/TasksModel.dart';
import 'package:todo/Widgets/splashscreen.dart';
import 'package:todo/Model/AddTask.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/stat.dart';


class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: Stat(),
      
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

void main() => runApp( TodoApp());