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
TimeOfDay newtime=TimeOfDay.now();
category selected=category.other;
DateTime date=DateTime.now();

List<Todo> todos = [];

category valuecategory(String cat){

  return cat==category.assignment.name?category.assignment:cat==category.chore.name?
  category.chore:cat==category.sport.name?category.sport:cat==category.meeting.name?
  category.meeting:cat==category.groceries.name?category.groceries:cat==category.music.name?
  category.music:category.other;
}

class Todo {
  Todo({this.id,required this.name,  this.checked="false", this.cat="other", required this.reminder, this.shared="false",required this.description});
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
      reminder: map['reminder'] ?? DateTime.now().toIso8601String(),
      shared: map['shared']??"false",
      description: map['description']??'not specified',
      id: map['id']?.toInt(),

    );
  }


  @override
  String toString() =>"name: $name, cat: $cat, rem: $reminder, des: $description, checked: $checked, category: $cat, shared: $shared, id: $id";
}