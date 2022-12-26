import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:biodata_siswa/models/anggota.dart';

class HelperDB {
  static final HelperDB _instance = HelperDB.internal();
  factory HelperDB() => _instance;
  final String tableAnggota = 'anggotaTable';
  final String columnId = 'id';
  final String columnNim = 'nim';
  final String columnNama = 'nama';
  final String columnAlamat = 'alamat';
  final String columnJenisKelamin = 'jenisKelamin';
  final String columnTglLahir = 'tglLahir';

  static Database? _db;

  HelperDB.internal();

  static HelperDB get instance => _instance;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'anggota.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableAnggota ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnNim INTEGER, $columnNama TEXT, $columnAlamat TEXT, $columnJenisKelamin TEXT, $columnTglLahir TEXT)");
  }

  Future<void> insertAnggota(Anggota anggota) async {
    final Database db = await HelperDB().db;
    await db.insert(
      "$tableAnggota",
      anggota.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Anggota>> anggotaList() async {
    final Database db = await HelperDB().db;
    final List<Map<String, dynamic>> maps = await db.query("$tableAnggota");

    return List.generate(maps.length, (i) {
      return Anggota(
        id: maps[i]['id'],
        nim: maps[i]['nim'],
        nama: maps[i]['nama'],
        alamat: maps[i]['alamat'],
        jenisKelamin: maps[i]['jenisKelamin'],
        tglLahir: maps[i]['tglLahir'],
      );
    });
  }

  Future<void> deleteAnggota(int id) async {
    final db = await HelperDB().db;

    await db.delete(
      "$tableAnggota",
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }
}
