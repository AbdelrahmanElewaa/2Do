import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Tasks/Data/sharedTasksData.dart';
import 'dart:convert';

void createTask({required String name, required String checked, required String cat, required String rem, required String shared, required String des}) async {
  final docTask=FirebaseFirestore.instance.collection('tasks').doc();
  final task=SharedTodo(id: docTask.id,name:name,checked: checked,description: des,reminder: rem,cat: cat,shared: shared );
final map=task.toMap();
await docTask.set(map);
}


void createTaskobj(SharedTodo todo) async {
  final docTask=FirebaseFirestore.instance.collection('tasks').doc();
  todo.id=docTask.id;
  final map=todo.toMap();
await docTask.set(map);
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
   
