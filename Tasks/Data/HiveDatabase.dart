import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Tasks/Data/TasksData.dart';

import '../../Helper/IDGen.dart';
import 'TaskDataHive.dart';

class ToDoDataBase {
  // static final ToDoDataBase _instance=ToDoDataBase._instance();
   List<Todo> todos = [];

  // reference our box
  final _myBox = Hive.box<TodoHive>('todobox');

  // factory ToDoDataBase() {
  //   return _instance();
  // }

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
     todos= <Todo>[
      // Todo(name: "walk the dog", checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des)
      Todo(id: IDGen.nextID(),name: "walk the dog", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "bhbh",reminder: TimeOfDay.now()),
      Todo(id: IDGen.nextID(),name: "assignment", checked: false,cat: category.assignment,percentage: randomNumber.toDouble(),description: "gvjgvh",reminder: TimeOfDay.now()),
      Todo(id: IDGen.nextID(),name: "meeting", checked: false,cat: category.meeting,percentage: randomNumber.toDouble(),description: "bhhhj",reminder: TimeOfDay.now()),
      Todo(id: IDGen.nextID(),name: "doctor's apppointment", checked: false,cat: category.meeting,percentage: randomNumber.toDouble(),description: "bhjhbj",reminder: TimeOfDay.now()),



    ];
     // updateDataBase();
  }

   void addTodoItem({required String name, required category cat, required TimeOfDay rem,required String des}) {
     Random random =  Random();
     int randomNumber = random.nextInt(101);


     todos.add(Todo( id: IDGen.nextID(),name: name, checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des));

   }

  // load the data from database
  void loadData() {
    todos = _myBox.get("todolist") as List<Todo>;
  }

  // update the database
  void updateDataBase() {
    _myBox.put("todolist", TodoHive(tods: todos));
  }
}