import 'dart:math';

import 'package:flutter/material.dart';
enum category
{
  assignment,
  chore,
  sport,
  meeting,
  groceries,
  music,
  other
}




List<Todo> todos = <Todo>[];
void addTodoItem({required String name, required category cat, required String rem,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);
  // setState(() {

  todos.add(Todo(name: name, checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des));
  // }
  // );
  // _textFieldController.clear();
}
class Todo {
  Todo({required this.name,  this.checked=false, this.cat=category.other,  this.reminder="12:43", this.percentage=0.0,required this.description});
  String name;
  bool checked;
  category cat;
  String reminder;
  double percentage;
  String description;






  @override
  String toString() =>"name: $name, cat: $cat, rem: $reminder, des: $description";
}