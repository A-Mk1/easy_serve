import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'easyserve.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('CREATE TABLE requests(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)');
    });
  }

  Future<int> insertRequest(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('requests', row);
  }

  Future<List<Map<String, dynamic>>> getRequests() async {
    final db = await database;
    return await db.query('requests', orderBy: 'id DESC');
  }

  Future<int> deleteRequest(int id) async {
    final db = await database;
    return await db.delete('requests', where: 'id = ?', whereArgs: [id]);
  }
}