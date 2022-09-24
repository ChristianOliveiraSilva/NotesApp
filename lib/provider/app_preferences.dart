import 'package:notes/model/Annotation.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBAbstraction {
  static Database? database;

  static Future<Database?> getConnection() async {
    if (DBAbstraction.database != null) {
      return DBAbstraction.database;
    }

    final dbPath = await getDatabasesPath();
    final dbName = path.join(dbPath, 'list.db');

    DBAbstraction.database = await openDatabase(
      dbName,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE annotations (name TEXT, text TEXT, date TEXT)',
        );
      },
      version: 1,
    );

    return DBAbstraction.database;
  }

  static Future<void> saveList({required List<Annotation> list}) async {
    final Database? db = await getConnection();

    for (var annotation in list) {
      await db!.insert(
        'annotations',
        annotation.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<List<Annotation>> getList() async {
    final Database? db = await getConnection();

    final List<Map<String, dynamic>> maps = await db!.query('annotations');

    return List.generate(maps.length, (i) {
      return Annotation(
        name: maps[i]['name'],
        text: maps[i]['text'],
        date: maps[i]['date'],
      );
    });
  }
}