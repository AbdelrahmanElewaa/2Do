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


Random random =  Random();
int randomNumber = random.nextInt(101);
// addstringonly(name: "walk the dog", des: "sdf");
// addstringonly(name: "assignment", des: "thdsf");
// addstringonly(name: "meeting", des: "dsgdsg");
// addstringonly(name: "doctor's apppointment", des: "terfgdfg");
List<Todo> todos = <Todo>[
  // Todo(name: "walk the dog", checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des)
   Todo(name: "walk the dog", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "bhbh"),
  Todo(name: "assignment", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "gvjgvh"),
  Todo(name: "meeting", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "bhhhj"),
  Todo(name: "doctor's apppointment", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "bhjhbj"),



];

void addTodoItem({required String name, required category cat, required String rem,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);


  todos.add(Todo(name: name, checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des));

}

void addstringonly({required String name,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);
  // setState(() {

    todos.add(Todo(name: name, checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: des));
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