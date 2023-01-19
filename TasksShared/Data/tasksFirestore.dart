import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/TasksShared/Data/sharedTasksData.dart';
import 'dart:convert';

Future<String> createTask({required String name, required String checked, required String cat, required String rem, required String shared, required String des,required String uid}) async {
  final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc();
  final task=SharedTodo(id: docTask.id,name:name,checked: checked,description: des,reminder: rem,cat: cat,shared: shared,sharedwith: shared );
final map=task.toMap();
await docTask.set(map);
return docTask.id;
}


Future<String> createTaskobj(SharedTodo todo,String uid) async {
  final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc();
  todo.id=docTask.id;
  final map=todo.toMap();
await docTask.set(map);
return docTask.id;
}

Stream<List<SharedTodo>> readTasks(String uid){
  return FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').
  snapshots().map((event) => 
  event.docs.map((e) => 
  SharedTodo.fromMap(e.data())).toList());
}




Future<void> delete(String id,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(id).delete();
}
   
Future<void> editTask(String id,SharedTodo todo,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(id).update(todo.toMap());
}

Future<void> addnotificationid(String id,int notid,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(id).update({"notid": notid});
}