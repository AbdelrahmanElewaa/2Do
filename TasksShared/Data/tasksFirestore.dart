import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/TasksShared/Data/sharedTasksData.dart';
import 'dart:convert';

Future<String> createTask({required String name, required String checked, 
required String cat, required String rem, required String shared, 
required String des,required String uid,required String sharedwith,String taskid=' '}) async {
  // SharedTodo task;
  if (taskid==' '){
  final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc();

  SharedTodo task=SharedTodo(id: docTask.id,name:name,checked: checked,
  description: des,reminder: rem,cat: cat,shared: shared,sharedwith: sharedwith );
  final map=task.toMap();
await docTask.set(map);
return docTask.id;
  }
  else{
  final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(taskid);

  SharedTodo task=SharedTodo(id: taskid,name:name,checked: checked,
  description: des,reminder: rem,cat: cat,shared: shared,sharedwith: sharedwith );
 
final map=task.toMap();
await docTask.set(map);
return taskid;
  }
}



Future<String> createTaskobj({required SharedTodo todo,required String uid}) async {

    final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc();
    todo.id=docTask.id;
    final map=todo.toMap();
    await docTask.set(map);
   await createTaskobjforshared(uid: uid,todo: todo);
    return docTask.id;


}


Future<String> createTaskobjforshared({required SharedTodo todo,required String uid}) async {
  final temp=todo.sharedwith;
todo.sharedwith=uid;
uid=temp;

    final docTask=FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(todo.id!);
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




Future<void> delete(SharedTodo todo,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(todo.id).delete();
  await FirebaseFirestore.instance.collection('users').doc(todo.sharedwith).collection('tasks').doc(todo.id).delete();
}
   
Future<void> editTask(SharedTodo todo,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(todo.id).update(todo.toMap());
  final temp=todo.sharedwith;
  todo.sharedwith=uid;
  uid=temp;
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(todo.id).update(todo.toMap());
}

Future<void> addnotificationid(String id,int notid,String uid) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('tasks').doc(id).update({"notid": notid});
}