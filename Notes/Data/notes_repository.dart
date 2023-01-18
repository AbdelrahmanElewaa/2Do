import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Shared/Data/constants.dart';
import 'db_helper.dart';
import '../Domain/notes.dart';

class NotesRepository {
  //singleton pattern
  static final NotesRepository instance = NotesRepository._();
  NotesRepository._();

  final _dbHelper = DBHelper.instance;

  Future<int> insert(title, content, date) async {
    // row to insert
    Map<String, dynamic> row = {
      Columns.title.name: title,
      Columns.content.name: content,
      Columns.date.name: date,
    };

    Note note = Note.fromMap(row);
    debugPrint('inserting $note');
    final id = await _dbHelper.insert(note);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<List<Note>> fetchNoteList() async {
    final allRows = await _dbHelper.queryAllRows();
    List<Note> notes = [];
    for (var row in allRows) {
      notes.add(Note.fromMap(row));
    }
    return notes;
  }

  Future<List<Note>> fetchNoteListAsc() async {
    final allRows = await _dbHelper.queryAllRowsAsc();
    List<Note> notes = [];
    for (var row in allRows) {
      notes.add(Note.fromMap(row));
    }
    return notes;
  }

  Future<List<Note>> fetchNoteListByName(title) async {
    final allRows = await _dbHelper.queryRows(title);
    List<Note> notesByTitle = [];
    for (var row in allRows) {
      notesByTitle.add(Note.fromMap(row));
    }
    return notesByTitle;
  }

  Future<Note> fetchNote(id) async {
    final allRows = await _dbHelper.getById(id);
    return allRows.isEmpty ? Note.empty(id) : Note.fromMap(allRows[0]);
  }

  Future<int> update(Note note) async {
    final rowsAffected = await _dbHelper.update(note);
    return rowsAffected;
  }

  Future<int> delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await _dbHelper.delete(id);
    return rowsDeleted;
  }

  Future<void> reset() async {
    return await _dbHelper.reset();
  }
}
