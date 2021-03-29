import 'package:secure_passord/models/password_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  String _databaseName = "dbpassword";
  String tableName = "passwords";
  int _version = 1;
  Database database;

  String _columName = "name";
  String _columnUsername = "username";
  String _columnPassword = "password";
  String _columnImgUrl = "imgUrl";
  String _colunmId = "id";

  Future<void> open() async {
    database = await openDatabase(_databaseName, version: _version,
        onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName (
            $_colunmId Integer PRIMARY KEY AUTOINCREMENT,
            $_columName VARCHAR(20),
            $_columnUsername VARCHAR(20),
            $_columnPassword VARCHAR(20),
            $_columnImgUrl VARCHAR(20))''');
    });
  }

//? select *
  Future<List<PasswordModel>> getList() async {
    if (database == null) await open();
    List<Map> passwordsMap = [];
    try {
      passwordsMap = await database.query(tableName);
    } catch (e) {
      print("HATA" + e.toString());
    }
    return passwordsMap.map((e) => PasswordModel.fromJson(e)).toList();
  }

  //? select where id ?
  Future<PasswordModel> getItem(int id) async {
    if (database == null) await open();
    List<Map> passwordsMap = await database.query(tableName,
        where: '$_colunmId =?', columns: [_colunmId], whereArgs: [id]);

    if (passwordsMap.isNotEmpty) {
      return PasswordModel.fromJson(passwordsMap.first);
    } else {
      return null;
    }
  }

  //?delete
  Future<bool> deleteItem(int id) async {
    if (database == null) await open();
    final passwordsMap = await database
        .delete(tableName, where: '$_colunmId =?', whereArgs: [id]);

    return passwordsMap != null;
  }

  //?insert
  Future<int> insertItem(PasswordModel model) async {
    if (database == null) await open();
    final passwordsMap = await database.insert(
      tableName,
      model.toJson(),
    );

    return passwordsMap;
  }

  //?update
  Future<bool> updateItem(int id, PasswordModel model) async {
    if (database == null) await open();
    final passwordsMap = await database.update(tableName, model.toJson(),
        where: '$_colunmId =?', whereArgs: [id]);

    return passwordsMap != null;
  }

  Future<void> close(args) async {
    await database.close();
  }
}
