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
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 200,
                height: 200,
                child: const Icon(
                  Icons.person,
                  size: 200,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "NIM : ${args['nim']}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Nama : ${args['nama']}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Alamat : ${args['alamat']}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Jenis Kelamin : ${args['jenisKelamin']}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Tanggal Lahir : ${args['tglLahir']}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                HelperDB().deleteAnggota((args['id']));
                Navigator.pushNamed(context, '/');
              },
              child: const Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
