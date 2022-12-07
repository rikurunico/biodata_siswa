import 'dart:io';

import 'package:biodata_siswa/controller/anggota.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;
  DbHelper.createObject();

  Future<Database> initializeDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'anggota.db';

    //membuat, membuka dan menginisialisasi database
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);

    return itemDatabase;
  }

  //buat tabel baru dengan nama anggota
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE anggota (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nim INTEGER,
        nama TEXT,
        alamat TEXT,
        jeniskelamin TEXT,
        tanggallahir TEXT
      )
    ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initializeDb();
    var mapList = await db.query('anggota', orderBy: 'nama');
    return mapList;
  }

  //create databases
  Future<int> insert(Map<String, dynamic> object) async {
    Database db = await this.initializeDb();
    int count = await db.insert('anggota', object);
    return count;
  }

  //update databases
  Future<int> update(Map<String, dynamic> object) async {
    Database db = await this.initializeDb();
    int count = await db
        .update('anggota', object, where: 'id=?', whereArgs: [object['id']]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initializeDb();
    int count = await db.delete('anggota', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //select databases by id
  Future<List<Map<String, dynamic>>> selectById(int id) async {
    Database db = await this.initializeDb();
    var mapList = await db.query('anggota', where: 'id=?', whereArgs: [id]);
    return mapList;
  }

  Future<List<Anggota>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Anggota> itemList = <Anggota>[];
    for (int i = 0; i < count; i++) {
      itemList.add(Anggota.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper.createObject();
    }
    return _dbHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDb();
    }
    return _database!;
  }
}
