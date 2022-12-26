import 'package:flutter/material.dart';
import 'package:biodata_siswa/models/anggota.dart';
import 'package:biodata_siswa/database/helperdb.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //Read Data From Database
  List<Anggota> anggota = [];
  void getAnggota() async {
    anggota = await HelperDB.instance.anggotaList();
    setState(() {
      anggota = anggota;
    });
  }

  @override
  void initState() {
    super.initState();
    getAnggota();
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
                  'id': anggota[index].id,
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
          Navigator.pushNamed(context, '/register');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
