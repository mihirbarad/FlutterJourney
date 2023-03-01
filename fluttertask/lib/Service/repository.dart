import 'package:fluttertask/Service/Database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection databaseConnection;

  Repository() {
    databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await databaseConnection.setDatabase();
      return _database;
    }
  }

  InsertTask(table, data) async {
    var connection = await database;
    print(" Insert _------Task");

    return await connection?.insert(table, data);
  }

  selectTask(table) async {
    var conncetion = await database;
    print("<---------data fetch send--------->");
    return await conncetion?.rawQuery("select * from $table");
  }

  deleteTask(table, itemID) async {
    var conncetion = await database;
    return await conncetion
        ?.rawDelete('DELETE FROM $table WHERE id = ?', [itemID]);
  }

  fetchEntrybymonth(table, monthname) async {
    var conncetion = await database;
    return await conncetion?.query(table,
        columns: ['id', 'amount', 'title', 'date', 'time'],
        where: 'date = ?',
        whereArgs: [monthname]);
  }
}
