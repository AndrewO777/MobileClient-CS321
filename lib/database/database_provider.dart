import 'database.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static AppDatabase? _database;

  static AppDatabase get instance {
    _database ??= AppDatabase();
    return _database!;
  }

  static Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}