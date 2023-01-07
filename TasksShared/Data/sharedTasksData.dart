import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

enum category { assignment, chore, sport, meeting, groceries, music, other }

TimeOfDay newtime = TimeOfDay.now();
category selected = category.other;
DateTime date = DateTime.now();

List<SharedTodo> todos = [];

category valuecategory(String cat) {
  return cat == category.assignment.name
      ? category.assignment
      : cat == category.chore.name
          ? category.chore
          : cat == category.sport.name
              ? category.sport
              : cat == category.meeting.name
                  ? category.meeting
                  : cat == category.groceries.name
                      ? category.groceries
                      : cat == category.music.name
                          ? category.music
                          : category.other;
}
   List<SharedTodo> fromListjson(String data) {
    // return   json.decode(data).cast<Todo>();
    return fromListMap(List<Map<String, dynamic>>.from(jsonDecode(data)));
  }


  List<SharedTodo> fromListMap(List<Map<String, dynamic>> map) {
    List<SharedTodo> tod=[];
    for (int i=2;i<map.length;i++){
      tod.add(SharedTodo(
      name: map[i]['name'] ?? 'not specified',
      checked: map[i]['checked'] ?? "false",
      cat: map[i]['category'] ?? category.other.name,
      reminder: map[i]['reminder'] ?? DateTime.now().toIso8601String(),
      shared: map[i]['shared'] ?? "false",
      description: map[i]['description'] ?? 'not specified',
      id: map[i]['id']??'',
    ));
    }
    return tod;
  }

class SharedTodo {
  SharedTodo(
      {this.id,
      required this.name,
      this.checked = "false",
      this.cat = "other",
      required this.reminder,
      this.shared = "false",
      required this.description,
      this.notid});
  String name;
  String checked;
  String cat;
  String reminder;
  String shared;
  String description;
  String? id;
  int? notid;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'checked': checked,
      'category': cat,
      'reminder': reminder,
      'shared': shared,
      'description': description,
      'id': id,
      'notid': notid
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
      notid: map['notid']?.toInt(),
    );
  }

  SharedTodo.fromSnapshot(DataSnapshot snapshot)
      : id = (snapshot.value as Map<String, dynamic>)["id"],
        name = (snapshot.value as Map<String, dynamic>)["name"],
        cat = (snapshot.value as Map<String, dynamic>)["cat"],
        reminder = (snapshot.value as Map<String, dynamic>)["reminder"],
        shared = (snapshot.value as Map<String, dynamic>)["shared"],
        description = (snapshot.value as Map<String, dynamic>)["description"],
        checked = (snapshot.value as Map<String, dynamic>)["checked"];

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
        reminder: DateTime.now().toIso8601String());
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      "name: $name, cat: $cat, rem: $reminder, des: $description, checked: $checked, category: $cat, shared: $shared, id: $id, notid: $notid";
}
