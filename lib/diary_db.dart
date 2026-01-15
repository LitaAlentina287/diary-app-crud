import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'diary.dart';

class DiaryDb {
  DiaryDb._();
  static final DiaryDb instance = DiaryDb._();

  static const _dbName = 'diary.db';
  static const _dbVersion = 1;
  static const table = 'diaries';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL,
          createdAt TEXT NOT NULL
        )
        ''');
      },
    );
  }

  Future<int> insert(Diary diary) async {
    final db = await database;
    return db.insert(table, diary.toMap());
  }

  Future<List<Diary>> getAll() async {
    final db = await database;
    final maps = await db.query(table, orderBy: 'createdAt DESC');
    return maps.map((e) => Diary.fromMap(e)).toList();
  }

  Future<int> update(Diary diary) async {
    final db = await database;
    return db.update(
      table,
      diary.toMap(),
      where: 'id = ?',
      whereArgs: [diary.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
