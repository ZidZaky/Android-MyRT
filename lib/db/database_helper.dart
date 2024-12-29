import 'package:android_myrt/db/account_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:android_myrt/DB/todo_db.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<String> get _databasePath async {
    const dbName = 'account.db';
    final path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<Database> _initDatabase() async {
    final path = await _databasePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Create tables here
    final accountDB = AccountDB();
    await accountDB.createTable(db);
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
    }
  }
}
