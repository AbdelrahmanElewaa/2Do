import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Tasks/Data/tasksDatabase.dart';
import '../../Shared/Data/constants.dart';
import 'TasksData.dart';


class TasksRepository {
  //singleton pattern
  static final TasksRepository instance = TasksRepository._();
  TasksRepository._();

  final _dbHelper = DBHelperTasks.instance;

  Future<int> insert(name, checked, cat,rem,shared,des,idd) async {
    // row to insert
    Map<String, dynamic> row = {
      tasksCulomns.name.name: name,
      tasksCulomns.checked.name: checked,
      tasksCulomns.category.name: cat,
      tasksCulomns.reminder.name: rem,
      tasksCulomns.shared.name: shared,
      tasksCulomns.description.name: des,
      tasksCulomns.id.name: idd,
    };

    Todo todo = Todo.fromMap(row);
    debugPrint('inserting $todo');
    final id = await _dbHelper.insert(todo);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<int> insertTodo(Todo todo) async {

    // row to insert
    Map<String, dynamic> row = {
      tasksCulomns.name.name: todo.name,
      tasksCulomns.checked.name: todo.checked,
      tasksCulomns.category.name: todo.cat,
      tasksCulomns.reminder.name: todo.reminder,
      tasksCulomns.shared.name: todo.shared,
      tasksCulomns.description.name: todo.description,
      tasksCulomns.id.name: todo.id,
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
    return todos;
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
