import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:todo/User/Data/UserData.dart';

Future<String> createUser({required name,required email,required pw,required mobile, uid}) async {
  final docUser=FirebaseFirestore.instance.collection('users').doc();
  final user=Userr(uid: docUser.id,name:name,email: email,mobile: mobile,pw: pw);
final map=user.toMap();
await docUser.set(map);
return docUser.id;
}


Future<String> createUserobj(Userr u) async {
  final docUser=FirebaseFirestore.instance.collection('users').doc();
  u.uid=docUser.id;
  final map=u.toMap();
await docUser.set(map);
return docUser.id;
}

Stream<List<Userr>> readUsers(){
  return FirebaseFirestore.instance.collection('users').
  snapshots().map((event) => 
  event.docs.map((e) => 
  Userr.fromMap(e.data())).toList());
}

Future<void> delete(String id) async {
  await FirebaseFirestore.instance.collection('users').doc(id).delete();
}
   
Future<void> editUser(String id,Userr u) async {
  await FirebaseFirestore.instance.collection('users').doc(id).update(u.toMap());
}


Future<Userr> getUser(String id) async {
  return await FirebaseFirestore.instance.collection('users').doc(id). get().then((value) => Userr.fromMap(value.data()!));
}
