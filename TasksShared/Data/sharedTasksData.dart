import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

enum category { assignment, chore, sport, meeting, groceries, music, other }

   



class SharedTodo {
  SharedTodo(
      {this.id,
      required this.name,
      this.checked = "false",
      this.cat = "other",
      required this.reminder,
      this.shared = "false",
      required this.description,
      required this.sharedwith});
  String name;
  String checked;
  String cat;
  String reminder;
  String shared;
  String description;
  String? id;
  String sharedwith;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'checked': checked,
      'category': cat,
      'reminder': reminder,
      'shared': shared,
      'description': description,
      'id': id,
      'sharedwith': sharedwith
    };
  }

  factory SharedTodo.fromMap(Map<String, dynamic> map) {
    return SharedTodo(
      name: map['name'] ?? 'not specified',
      checked: map['checked'] ?? "false",
      cat: map['category'] ?? category.other.name,
      reminder: map['reminder'] ?? DateTime.now().toIso8601String(),
      shared: map['shared'] ?? "false",
      description: map['description'] ?? 'not specified',
      id: map['id']??'',
      sharedwith: map['sharedwith']??'not specified'
    );
  }



  factory SharedTodo.fromJson(String data) {
    // return   json.decode(data).cast<Todo>();
    return SharedTodo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

factory SharedTodo.addstringonly({required String name, required String des}) {
    return SharedTodo(
        name: name,
        checked: "false",
        cat: category.other.name,
        description: des,
        reminder: DateTime.now().toIso8601String(),
        sharedwith: ' hkn');
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      "name: $name, cat: $cat, rem: $reminder, des: $description, checked: $checked, category: $cat, shared: $shared, id: $id";
}
