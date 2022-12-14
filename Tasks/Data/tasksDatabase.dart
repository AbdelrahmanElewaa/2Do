import 'package:sqflite/sqflite.dart';
import '../../Shared/Data/constants.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

import 'TasksData.dart';

class DBHelperTasks {
  final _databaseName = kDatabaseNameTasks;
  final _databaseVersion = kDatabaseVersion;
  final _table = kTableTasks;
  final createSQL = '''CREATE TABLE $kTableTasks (
      ${tasksCulomns.id.name} INTEGER PRIMARY KEY, 
      ${tasksCulomns.checked.name} TEXT, 
      ${tasksCulomns.category.name} TEXT,
      ${tasksCulomns.reminder.name} TEXT,
      ${tasksCulomns.shared.name} TEXT,
      ${tasksCulomns.description.name} TEXT,
      ${tasksCulomns.name.name} TEXT)''';

  Database? _database;
  static final DBHelperTasks instance = DBHelperTasks._();
  DBHelperTasks._();

  // only have a single app-wide reference to the database
  Future<Database> get database async {
    return _database ?? await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly set
    // for Android or iOS.
    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(createSQL);
      },
      // _database.
    );
    return _database!;
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  // `conflictAlgorithm` to use in case the same pet is inserted twice.
  // In this case, replace any previous data.
  Future<int> insert(Todo todo) async {
    Database db = await database;
    // db.execute(createSQL);
    debugPrint('fetching $db');
    return db.insert(
      _table,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(_table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(title) async {
    Database db = await database;
    return db.query(_table, where: "${tasksCulomns.name.name} LIKE '%$title%'");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Todo pet) async {
    Database db = await database;
    int id = pet.toMap()[tasksCulomns.id.name];
    debugPrint("rows affected: $id");
    return db.update(_table, pet.toMap(),
        where: '${tasksCulomns.id.name} = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await database;
    return db
        .delete(_table, where: '${tasksCulomns.id.name} = ?', whereArgs: [id]);
  }

  Future<void> reset() async {
    Database db = await database;
    await db.execute('DROP TABLE IF EXISTS $_table');
    await db.execute(createSQL);
  }

  Future<List<Map<String, dynamic>>> getById(id) async {
    Database db = await database;
    return db.query(_table, where: "${tasksCulomns.id.name} LIKE '%$id%'");
  }
}
