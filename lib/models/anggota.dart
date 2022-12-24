class Anggota {
  int? id;
  int nim;
  String nama;
  String alamat;
  String jenisKelamin;
  String tglLahir;

  Anggota({
    this.id,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nim': nim});
    result.addAll({'nama': nama});
    result.addAll({'alamat': alamat});
    result.addAll({'jenisKelamin': jenisKelamin});
    result.addAll({'tglLahir': tglLahir});

    return result;
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      id: map['id'],
      nim: map['nim'],
      nama: map['nama'],
      alamat: map['alamat'],
      jenisKelamin: map['jenisKelamin'],
      tglLahir: map['tglLahir'],
    );
  }
}
