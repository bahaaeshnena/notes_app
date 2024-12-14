import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future<Database> initialDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database.db');
    Database myDB = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    return myDB;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT
    )
   ''');
    log('===========================database created=================');
  }

  Future<int> insertData(String title, String content) async {
    log('===========================database insert($title , $content) =================');
    Database dbClient = await db;
    return await dbClient.insert(
      'notes',
      {
        'title': title,
        'content': content,
      },
    );
  }
  //   Future<int> insertData(String title, String content) async {
  //   Database dbClient = await db;
  //   return await dbClient.rawInsert(
  //       'INSERT INTO notes (title, content) VALUES(?, ?)',
  //       [title , content]
  //       );
  // }

  Future<List<Map<String, dynamic>>> readData() async {
    log('===========================database read =================');

    Database dbClient = await db;
    return await dbClient.query('notes');
  }

  // Future<List<Map<String, dynamic>>> readData() async {
  //   Database dbClient = await db;
  //   return await dbClient.rawQuery('SELECT * FROM notes');
  // }

  Future<int> updateData(int id, String title, String content) async {
    Database dbClient = await db;
    return await dbClient.update(
        'notes',
        {
          'title': title,
          'content': content,
        },
        where: 'id = ?',
        whereArgs: [id]);
  }

  Future<int> deleteData(int id) async {
    Database dbClient = await db;
    return await dbClient.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
