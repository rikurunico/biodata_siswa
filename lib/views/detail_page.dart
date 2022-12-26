import 'package:flutter/material.dart';
import 'package:biodata_siswa/database/helperdb.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['nama']),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "NIM : ${args['nim']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Nama : ${args['nama']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Alamat : ${args['alamat']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Jenis Kelamin : ${args['jenisKelamin']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Tanggal Lahir : ${args['tglLahir']}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                HelperDB().deleteAnggota((args['id']));
                Navigator.pushNamed(context, '/');
              },
              child: Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
