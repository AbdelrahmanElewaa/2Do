import 'dart:math';
import 'package:flutter/material.dart';
import '../../helper/IDGen.dart';
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
TimeOfDay newtime=TimeOfDay.now();
category selected=category.other;
Random random =  Random();
int randomNumber = random.nextInt(101);
// addstringonly(name: "walk the dog", des: "sdf");
// addstringonly(name: "assignment", des: "thdsf");
// addstringonly(name: "meeting", des: "dsgdsg");
// addstringonly(name: "doctor's apppointment", des: "terfgdfg");
List<Todo> todos = <Todo>[
  // Todo(name: "walk the dog", checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des)
   Todo(id: IDGen.nextID(),name: "walk the dog", checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: "bhbh",reminder: TimeOfDay.now()),
  Todo(id: IDGen.nextID(),name: "assignment", checked: false,cat: category.assignment,percentage: randomNumber.toDouble(),description: "gvjgvh",reminder: TimeOfDay.now()),
  Todo(id: IDGen.nextID(),name: "meeting", checked: false,cat: category.meeting,percentage: randomNumber.toDouble(),description: "bhhhj",reminder: TimeOfDay.now()),
  Todo(id: IDGen.nextID(),name: "doctor's apppointment", checked: false,cat: category.meeting,percentage: randomNumber.toDouble(),description: "bhjhbj",reminder: TimeOfDay.now()),



];

void addTodoItem({required String name, required category cat, required TimeOfDay rem,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);


  todos.add(Todo( id: IDGen.nextID(),name: name, checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des));

}

void addstringonly({required String name,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);

    todos.add(Todo(id: IDGen.nextID(),name: name, checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: des,reminder: TimeOfDay.now()));
  }

class Todo {
  Todo({required this.id,required this.name,  this.checked=false, this.cat=category.other, required this.reminder, this.percentage=0.0,required this.description});
  String name;
  bool checked;
  category cat;
  TimeOfDay reminder;
  double percentage;
  String description;
  int id;






  @override
  String toString() =>"name: $name, cat: $cat, rem: $reminder, des: $description";
}