import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:biodata_siswa/models/anggota.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _nimController = TextEditingController();
    final _namaController = TextEditingController();
    final _alamatController = TextEditingController();
    final _jenisKelaminController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BIODATA'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _nimController,
                decoration: const InputDecoration(
                  label: Text("NIM"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  label: Text("Nama"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  label: Text("Alamat"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(13),
              child: TextField(
                controller: _jenisKelaminController,
                decoration: const InputDecoration(
                  label: Text("Jenis Kelamin"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TanggalLahir(),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (() {}),
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TanggalLahir extends StatefulWidget {
  @override
  _TanggalLahir createState() => _TanggalLahir();
}

class _TanggalLahir extends State<TanggalLahir> {
  DateTime selectedDate = DateTime.now();
  final _tglLahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (newDate != null) {
                setState(() {
                  selectedDate = newDate;
                });
              }
            },
            child: const Text('Select Date'),
          ),
        ],
      ),
    );
  }
}