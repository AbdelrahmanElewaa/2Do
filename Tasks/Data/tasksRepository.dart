import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Tasks/Data/tasksDatabase.dart';
import 'package:todo/Tasks/Domain/AddTask.dart';
import '../../Helper/IDGen.dart';
import '../../Shared/Data/constants.dart';
import 'TasksData.dart';

class TasksRepository {
  //singleton pattern
  static final TasksRepository instance = TasksRepository._();
  TasksRepository._();

  final _dbHelper = DBHelperTasks.instance;

  Future<int> insert(name, checked, cat, rem, shared, des) async {
    // _dbHelper.database;
    // row to insert
    Map<String, dynamic> row = {
      tasksCulomns.name.name: name,
      tasksCulomns.checked.name: checked,
      tasksCulomns.category.name: cat,
      tasksCulomns.reminder.name: rem,
      tasksCulomns.shared.name: shared,
      tasksCulomns.description.name: des,
    };

    Todo todo = Todo.fromMap(row);
    debugPrint('inserting $todo');
    final id = await _dbHelper.insert(todo);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<int> insertTodo(Todo todo) async {
    // _dbHelper.initDatabase();

    // row to insert
    Map<String, dynamic> row = {
      tasksCulomns.name.name: todo.name,
      tasksCulomns.checked.name: todo.checked,
      tasksCulomns.category.name: todo.cat,
      tasksCulomns.reminder.name: todo.reminder,
      tasksCulomns.shared.name: todo.shared,
      tasksCulomns.description.name: todo.description,
    };

    Todo td = Todo.fromMap(row);
    debugPrint('inserting $td');
    final id = await _dbHelper.insert(td);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<List<Todo>> fetchTodoList() async {
    final allRows = await _dbHelper.queryAllRows();
    List<Todo> todos = [];
    for (var row in allRows) {
      todos.add(Todo.fromMap(row));
    }
    if (todos.isEmpty) {
      initTodos().then((value) {
        todos = value;
      });
    }
    return todos;
  }

  Todo addstringonly({required String name, required String des}) {
    return Todo(
        name: name,
        checked: "false",
        cat: category.other.name,
        description: des,
        reminder: DateTime.now().toIso8601String());
  }

  Future<List<Todo>> initTodos() async {
    insertTodo(addstringonly(name: " walk dog", des: "dsfgds"));
    insertTodo(addstringonly(name: " doctor", des: "dsfgds"));
    insertTodo(addstringonly(name: " meeting", des: "dsfgds"));
    insertTodo(addstringonly(name: " meeting", des: "dsfgds"));

    return fetchTodoList();
    // insertTodo( Todo(id: IDGen.nextID(),name: "walk the dog", checked: false,cat: category.sport,description: "bhbh",reminder: TimeOfDay.now()));
    // insertTodo(  Todo(id: IDGen.nextID(),name: "assignment", checked: false,cat: category.assignment,description: "gvjgvh",reminder: TimeOfDay.now()));
    // insertTodo(Todo(id: IDGen.nextID(),name: "meeting", checked: false,cat: category.meeting,description: "bhhhj",reminder: TimeOfDay.now()));
    // insertTodo(Todo(id: IDGen.nextID(),name: "doctor's apppointment", checked: false,cat: category.meeting,description: "bhjhbj",reminder: TimeOfDay.now()));
  }
  // Future<List<Todo>> fetchTodoListByName(title) async {
  //   final allRows = await _dbHelper.queryRows(title);
  //   List<Todo> petsByTitle = [];
  //   for (var row in allRows) {
  //     petsByTitle.add(Todo.fromMap(row));
  //   }
  //   return petsByTitle;
  // }

  // Future<Todo> fetchPet(id) async {
  //   final allRows = await _dbHelper.getById(id);
  //   return allRows.isEmpty ? Todo.empty(id) : Todo.fromMap(allRows[0]);
  // }

  Future<int> update(Todo todo) async {
    final rowsAffected = await _dbHelper.update(todo);
    return rowsAffected;
  }

  Future<int> delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await _dbHelper.delete(id);
    return rowsDeleted;
  }

  Future<void> reset() async {
    return await _dbHelper.reset();
  }
}
