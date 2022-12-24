import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:biodata_siswa/models/anggota.dart';

class database {
  static final database _instance = database.internal();
  factory database() => _instance;
  final String tableAnggota = 'anggotaTable';
  final String columnId = 'id';
  final String columnNim = 'nim';
  final String columnNama = 'nama';
  final String columnAlamat = 'alamat';
  final String columnJenisKelamin = 'jenisKelamin';
  final String columnTglLahir = 'tglLahir';

  static Database? _db;

  database.internal();

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
        "CREATE TABLE $tableAnggota ($columnId INTEGER PRIMARY KEY, $columnNim INTEGER, $columnNama TEXT, $columnAlamat TEXT, $columnJenisKelamin TEXT, $columnTglLahir TEXT)");
  }

  Future<int> saveAnggota(Anggota anggota) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableAnggota", anggota.toMap());
    return res;
  }

  Future<List> getAllAnggota() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableAnggota");
    return result.toList();
  }
}
