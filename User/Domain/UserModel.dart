import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/TasksShared/Data/sharedTasksData.dart';
import 'dart:convert';
Future<bool> getuser(String uid) async{
  return await FirebaseFirestore.instance.collection('users').where("uid",isEqualTo: uid ).get().then((value) {
if (value.size==0)
return false;
else
return true;
  });

  
}