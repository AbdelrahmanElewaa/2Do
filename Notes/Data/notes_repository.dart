import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Shared/Widgets/constants.dart';
import '../../data/db_helper.dart';
import '../Domain/notes.dart';

class PetsRepository {
  //singleton pattern
  static final PetsRepository instance = PetsRepository._();
  PetsRepository._();

  final _dbHelper = DBHelper.instance;

  Future<int> insert(title, content, date) async {
    // row to insert
    Map<String, dynamic> row = {
      Columns.title.name: title,
      Columns.content.name: content,
      Columns.date.name: date,
    };

    Pet pet = Pet.fromMap(row);
    debugPrint('inserting $pet');
    final id = await _dbHelper.insert(pet);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<List<Pet>> fetchPetList() async {
    final allRows = await _dbHelper.queryAllRows();
    List<Pet> pets = [];
    for (var row in allRows) {
      pets.add(Pet.fromMap(row));
    }
    return pets;
  }

  Future<List<Pet>> fetchPetListByName(title) async {
    final allRows = await _dbHelper.queryRows(title);
    List<Pet> petsByTitle = [];
    for (var row in allRows) {
      petsByTitle.add(Pet.fromMap(row));
    }
    return petsByTitle;
  }

  Future<Pet> fetchPet(id) async {
    final allRows = await _dbHelper.getById(id);
    return allRows.isEmpty ? Pet.empty(id) : Pet.fromMap(allRows[0]);
  }

  Future<int> update(Pet pet) async {
    final rowsAffected = await _dbHelper.update(pet);
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
