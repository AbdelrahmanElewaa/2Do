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
// addstringonly(name: "walk the dog", des: "sdf");
// addstringonly(name: "assignment", des: "thdsf");
// addstringonly(name: "meeting", des: "dsgdsg");
// addstringonly(name: "doctor's apppointment", des: "terfgdfg");
List<Todo> todos = [];
//   // Todo(name: "walk the dog", checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des)
//    Todo(id: IDGen.nextID(),name: "walk the dog", checked: false,cat: category.sport,description: "bhbh",reminder: TimeOfDay.now()),
//   Todo(id: IDGen.nextID(),name: "assignment", checked: false,cat: category.assignment,description: "gvjgvh",reminder: TimeOfDay.now()),
//   Todo(id: IDGen.nextID(),name: "meeting", checked: false,cat: category.meeting,description: "bhhhj",reminder: TimeOfDay.now()),
//   Todo(id: IDGen.nextID(),name: "doctor's apppointment", checked: false,cat: category.meeting,description: "bhjhbj",reminder: TimeOfDay.now()),
//
//
//
// ];
//
// void addTodoItem({required String name, required category cat, required TimeOfDay rem,required String des}) {
//
//   todos.add(Todo( id: IDGen.nextID(),name: name, checked: false,cat: cat,reminder: rem,description: des));
//
// }

// void addstringonly({required String name,required String des}) {
//     todos.add(Todo(id: IDGen.nextID(),name: name, checked: "false",cat: category.sport.name,description: des,reminder: "TimeOfDay.now()"));
//   }

class Todo {
  Todo({required this.id,required this.name,  this.checked="false", this.cat="other", required this.reminder, this.shared="false",required this.description});
  String name;
  String checked;
  String cat;
  String reminder;
  String shared;
  String description;
  int? id;




  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'checked': checked,
      'category': cat,
      'reminder': reminder,
      'shared': shared,
      'description': description,
      'id': id,

    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name']??'not specified',
      checked: map['checked'] ?? "false",
      cat: map['category'] ?? category.other.name,
      reminder: map['reminder'] ?? "TimeOfDay.now()",
      shared: map['shared']??"false",
      description: map['description']??'not specified',
      id: map['id']?.toInt(),

    );
  }


  @override
  String toString() =>"name: $name, cat: $cat, rem: $reminder, des: $description, checked: $checked, category: $cat, shared: $shared, id: $id";
}