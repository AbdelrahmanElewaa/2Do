import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo/Tasks/Data/TaskDataHive.dart';
import 'package:todo/Tasks/Data/TasksData.dart';

import 'HiveDatabase.dart';


// class provider{


  final todoprovider=StateProvider<List<Todo>>((ref) {
    Box<TodoHive> todobox = Hive.box<TodoHive>('todobox');
    ToDoDataBase db = ToDoDataBase();
    if (todobox.get("todolist") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
return db.todos;
    // we can also return an empty String here, for the sake of simplicity,
    //  let's return a sample name
    // return todos;
  });
// }

