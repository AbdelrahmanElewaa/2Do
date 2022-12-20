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




void addstringonly({required String name,required String des}) {
  Random random =  Random();
  int randomNumber = random.nextInt(101);

    // todos.add(Todo(id: IDGen.nextID(),name: name, checked: false,cat: category.sport,percentage: randomNumber.toDouble(),description: des,reminder: TimeOfDay.now()));
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