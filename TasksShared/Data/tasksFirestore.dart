import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/TasksShared/Data/sharedTasksData.dart';
import 'dart:convert';

Future<String> createTask({required String name, required String checked, required String cat, required String rem, required String shared, required String des}) async {
  final docTask=FirebaseFirestore.instance.collection('tasks').doc();
  final task=SharedTodo(id: docTask.id,name:name,checked: checked,description: des,reminder: rem,cat: cat,shared: shared );
final map=task.toMap();
await docTask.set(map);
return docTask.id;
}


Future<String> createTaskobj(SharedTodo todo) async {
  final docTask=FirebaseFirestore.instance.collection('tasks').doc();
  todo.id=docTask.id;
  final map=todo.toMap();
await docTask.set(map);
return docTask.id;
}

Stream<List<SharedTodo>> readTasks(){
  return FirebaseFirestore.instance.collection('tasks').
  snapshots().map((event) => 
  event.docs.map((e) => 
  SharedTodo.fromMap(e.data())).toList());
}

Future<void> delete(String id) async {
  await FirebaseFirestore.instance.collection('tasks').doc(id).delete();
}
   
Future<void> editTask(String id,SharedTodo todo) async {
  await FirebaseFirestore.instance.collection('tasks').doc(id).update(todo.toMap());
}

Future<void> addnotificationid(String id,int notid) async {
  await FirebaseFirestore.instance.collection('tasks').doc(id).update({"notid": notid});
}