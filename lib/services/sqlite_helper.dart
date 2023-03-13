import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqliteHelper {
  static const _databaseName = 'todos.db';
  static const _databaseVersion = 1;
  static const _tableName = 'todo';

  SqliteHelper._privateConstructor();
  static final SqliteHelper instance = SqliteHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets/db', _databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return await openDatabase(path, version: _databaseVersion);
    } else {
      //return await databaseFactory.deleteDatabase(path);
      return await openDatabase(path, version: _databaseVersion);
    }
  }


  Future<List<Map<String, dynamic>>> queryRows() async {
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }

  /*
   Future<List<Map<String, dynamic>>> queryWordRows(int level) async {
    Database? db = await instance.database;
    return await db!.rawQuery('SELECT * FROM $_tableWordName WHERE level=? ORDER BY no ASC', [level]);
  }
   */

  Future<int> insertTodo({required String id,required String user_id,required String title, required String description,required String date}) async {
    Database? db = await instance.database;
    return await db!.rawInsert('INSERT INTO $_tableName (id, user_id, title, description, date) VALUES(?, ?, ?, ?, ?)', [id, title, user_id, title, description, id]);
  }

  /*
  Future<int> insertTodo(WordKr data) async {
    Database? db = await instance.database;
    return await db!.rawUpdate('INSERT INTO $_tableMyName (no,level,word,min,sentence,wordtest) VALUES(?,?,?,?,?,?)'
        , [data.no,data.level,data.word,data.min,data.sentence,data.wordtest]);
  }
  * */

  Future<int> updateTodo({required String title, required String description, required String id}) async {
    Database? db = await instance.database;
    return await db!.rawUpdate('UPDATE $_tableName SET title = ?, description = ? WHERE id= ?', [title, description,id]);
  }

  Future<int> deleteTodo({required int id}) async {
    Database? db = await instance.database;
    return await db!.rawDelete('DELETE FROM $_tableName WHERE id = ?', [id]);
  }

  /*
  // 모두 삭제
  Future<int> deleteAllMyBook() async {
    Database? db = await instance.database;
    return await db!.rawUpdate('DELETE FROM $_tableMyName');
  }
   */
}
