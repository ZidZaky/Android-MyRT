import 'package:sqflite/sqflite.dart';
import 'package:android_myrt/DB/database_helper.dart';
import 'package:android_myrt/Model/Account.dart';

class AccountDB {
  final tableName = 'account';

  Future<void> createTable(Database db) async {
    await db.execute("""
        CREATE TABLE IF NOT EXISTS $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL,
          password TEXT NOT NULL,
          email TEXT NOT NULL
        );
      """);
  }

  Future<int> create({
    required String username,
    required String password,
    required String email,
  }) async {
    final database = await DatabaseHelper().database;

    return await database.rawInsert("""
        INSERT INTO $tableName (username, password, email) 
        VALUES (?, ?, ?)
      """, [username, password, email]);
  }

  Future<List<Account>> getAll() async {
    final database = await DatabaseHelper().database;

    final accounts = await database.rawQuery("""
        SELECT * FROM $tableName
      """);

    return accounts.map((account) => Account.fromSqfliteDatabase(account)).toList();
  }

  Future<Account?> getById(int id) async {
    final database = await DatabaseHelper().database;

    final result = await database.rawQuery("""
        SELECT * FROM $tableName WHERE id = ?
      """, [id]);

    if (result.isNotEmpty) {
      return Account.fromSqfliteDatabase(result.first);
    }
    return null;
  }

  Future<int> update({
    required int id,
    String? username,
    String? password,
    String? email,
  }) async {
    final database = await DatabaseHelper().database;

    final values = {
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
    };

    return await database.update(
      tableName,
      values,
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseHelper().database;

    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
