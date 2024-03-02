import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance {
    return _databaseHelper ??= DatabaseHelper._internal();
  }

  Database? _db;
  Database get db => _db!;

  Future<void> init() async {
    _db = await openDatabase(
      "shoping.db",
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            priceHigher REAL NOT NULL,
            priceUnit REAL NOT NULL,
            image TEXT NOT NULL
          )
          ''',
        );
      },
    );
  }
}
