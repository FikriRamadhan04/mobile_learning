import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mahasiswa.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _instance;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'mhs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE mahasiswa(
            nim TEXT PRIMARY KEY, 
            nama TEXT
          )
          ''');
      },
    );
  }

  Future<void> insertMahasiswa(Mahasiswa mahasiswa) async {
    final db = await database;
    await db.insert(
      'mahasiswa',
      mahasiswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mahasiswa');
    return List.generate(maps.length, (i) {
      return Mahasiswa.fromMap(maps[i]);
    });
  }
}
