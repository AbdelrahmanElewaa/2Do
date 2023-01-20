import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import '../Domain/shared_notes.dart';

Future<String> createNotes(
    {required String id,
    required String title,
    required String content,
    required String date}) async {
  final docNote = FirebaseFirestore.instance.collection('notes').doc(id);
  final note = SharedNote(
    id: docNote.id,
    title: title,
    content: content,
    date: date,
  );
  final map = note.toMap();
  await docNote.set(map);
  return docNote.id;
}

Future<void> deleteNotes(String id) async {
  await FirebaseFirestore.instance.collection('notes').doc(id).delete;
}

Stream<List<SharedNote>> readNotes() {
  return FirebaseFirestore.instance.collection('notes').snapshots().map(
      (event) => event.docs.map((e) => SharedNote.fromMap(e.data())).toList());
}

Future<void> editNotes(String id, SharedNote notee) async {
  await FirebaseFirestore.instance
      .collection('notes')
      .doc(id)
      .update(notee.toMap());
}
