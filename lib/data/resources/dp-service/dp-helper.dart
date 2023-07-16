import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:revisino_sqflite/data/models/dp-model.dart';

class DatabaseHelper {
  DatabaseHelper._internal();
  static DatabaseHelper instance = DatabaseHelper._internal();

  static const String _databaseName = 'friend.dp';
  static const int _databaseVersion = 1;
  static const String _tableName = 'Friends';
  static const String _columnId = 'id';
  static const String _name = 'name';
  static const String _phoneNumber = 'phoneNumber';
  static const String _address = 'address';

  static Database? _db;
  Future<Database> get _database async {
    if (_db != null) return _db!;
    _db = await _initializeDatabase();
    return _db!;
  }

  Future<Database> _initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    return await db.execute('''CREATE TABLE $_tableName(
      $_columnId INTEGER PRIMARY KEY,
      $_name TEXT NOT NULL,
      $_phoneNumber TEXT NOT NULL,
      $_address TEXT NOT NULL
      )
      ''');
  }

  Future<List<FriendContact>> getDatabase() async {
    Database db = await instance._database;
    List<Map<String, dynamic>> response = await db.query(_tableName, columns: [
      _columnId,
      _name,
      _phoneNumber,
      _address,
    ]);
    return response.map((e) => FriendContact.fromjson(e)).toList();
  }

  Future<int> insertDatabase(FriendContact contact) async {
    Database db = await instance._database;
    return await db.insert(_tableName, contact.toMap());
  }
 Future<List<FriendContact>> searchDatabase(String name) async {
    Database db = await instance._database;
    List<Map<String,dynamic>>response= await db.query(
        _tableName,
        where:'$_name Like?',
      whereArgs: ['%$name'],
    );
    return  response.map((e) => FriendContact.fromjson(e)).toList();
  }
}
