import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mahasiswa.dart'; 

class DatabaseHelper {

  static Database? _database;

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

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

  Future<int> deleteMahasiswa(String nim) async {
    final db = await database;
    return await db.delete(
      'mahasiswa',
      where: 'nim = ?',
      whereArgs: [nim],
    );
  }
  
  Future<int> updateMahasiswa(Mahasiswa mahasiswa) async {
    final db = await database;
    return await db.update(
      'mahasiswa',
      mahasiswa.toMap(),
      where: 'nim = ?',
      whereArgs: [mahasiswa.nim],
    );
  }
}