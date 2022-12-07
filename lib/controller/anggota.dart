class Anggota {
  late int _id;
  late int _nim;
  late String _nama;
  late String _alamat;
  late String _jeniskelamin;
  late DateTime _tanggallahir;

  int get id => _id;

  int get nim => _nim;
  set nim(int value) => this._nim = value;

  String get nama => _nama;
  set nama(String value) => this._nama = value;

  String get alamat => _alamat;
  set alamat(String value) => this._alamat = value;

  String get jeniskelamin => _jeniskelamin;
  set jeniskelamin(String value) => this._jeniskelamin = value;

  DateTime get tanggallahir => _tanggallahir;
  set tanggallahir(DateTime value) => this._tanggallahir = value;

  Anggota(this._id, this._nim, this._nama, this._alamat, this._jeniskelamin,
      this._tanggallahir);

  Anggota.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nim = map['nim'];
    this._nama = map['nama'];
    this._alamat = map['alamat'];
    this._jeniskelamin = map['jeniskelamin'];
    this._tanggallahir = map['tanggallahir'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nim'] = nim;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['jeniskelamin'] = jeniskelamin;
    map['tanggallahir'] = tanggallahir;
    return map;
  }
}
