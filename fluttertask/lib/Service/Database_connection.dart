import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "todo");

    var database =
        await openDatabase(path, version: 1, onCreate: Createdatabase);
    return database;
  }

  Future<void> Createdatabase(Database database, int version) async {
    print("Database crete");

    String sql =
        "create table task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,  description  TEXT , time TEXT , date TEXT )";

    await database.execute(sql);
  }
}
