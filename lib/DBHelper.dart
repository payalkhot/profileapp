import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'user.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String FIRSTNAME = 'firstName';
  static const String LASTNAME = 'lastName';
  static const String PINCODE = 'pinCode';
  static const String NUMBER = 'Number';
  static const String TABLE = 'User';
  static const String DB_NAME = 'user1.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY AUTO INCREMENT, $FIRSTNAME TEXT, $LASTNAME TEXT, $PINCODE TEXT, $NUMBER TEXT)");
  }

  Future<User> save(User user) async {
    var dbClient = await db;
    //user.id = await dbClient.insert(TABLE, user.toMap());

    print(user.firstName);
    print(user.firstName);
    print(user.pinCode);
    print(user.number);


    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($FIRSTNAME,$LASTNAME,$PINCODE,$NUMBER) VALUES ('" + user.firstName + user.lastName + user.pinCode+user.number+"')";

      return await txn.rawInsert(query);

    });
    return user;
  }



  Future<List<User>> getUsers() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, FIRSTNAME, LASTNAME, PINCODE, NUMBER]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.fromMap(maps[i]));
      }
    }
    return users;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(User user) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, user.toMap(),
        where: '$ID = ?', whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}