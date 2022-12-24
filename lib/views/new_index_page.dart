import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:biodata_siswa/models/anggota.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Anggota> anggota = [
    Anggota(
        nim: 000001,
        nama: 'Wazir Qorni Abud',
        alamat: 'Lamongan',
        jenisKelamin: "Laki-laki",
        tglLahir: "2000-01-01"),
    Anggota(
        nim: 000002,
        nama: 'Wazir Qorni Abud 2',
        alamat: 'Lamongan',
        jenisKelamin: "Laki-laki",
        tglLahir: "2000-01-01"),
    Anggota(
        nim: 000003,
        nama: 'Wazir Qorni Abud 3',
        alamat: 'Lamongan',
        jenisKelamin: "Laki-laki",
        tglLahir: "2000-01-01"),
    Anggota(
        nim: 000004,
        nama: 'Wazir Qorni Abud 4',
        alamat: 'Lamongan',
        jenisKelamin: "Laki-laki",
        tglLahir: "2000-01-01"),
    Anggota(
        nim: 000005,
        nama: 'Wazir Qorni Abud 5',
        alamat: 'Lamongan',
        jenisKelamin: "Laki-laki",
        tglLahir: "2000-01-01"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIODATA'),
      ),
      body: ListView.builder(
        itemCount: anggota.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(anggota[index].nama),
              subtitle: Text(anggota[index].alamat),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: {
                  'nim': anggota[index].nim,
                  'nama': anggota[index].nama,
                  'alamat': anggota[index].alamat,
                  'jenisKelamin': anggota[index].jenisKelamin,
                  'tglLahir': anggota[index].tglLahir,
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
