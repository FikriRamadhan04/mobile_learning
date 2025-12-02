import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mahasiswa.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'mahasiswa';
  final String columnId = 'id';
  final String columnNim = 'nim';
  final String columnNama = 'nama';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'mahasiswa_db.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNim TEXT UNIQUE,
            $columnNama TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertMahasiswa(Mahasiswa mahasiswa) async {
    final db = await database;
    return await db.insert(
      tableName,
      mahasiswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Mahasiswa>> getMahasiswaList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Mahasiswa.fromMap(maps[i]);
    });
  }

  Future<int> deleteMahasiswa(int id) async {
    final db = await database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
