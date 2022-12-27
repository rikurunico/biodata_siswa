import 'package:flutter/material.dart';
import 'package:biodata_siswa/database/helperdb.dart';
import 'package:biodata_siswa/models/anggota.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatelessWidget {
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _jenisKelaminController = TextEditingController();
  final _tglLahirController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: Column(
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
              child: TextField(
                controller: _tglLahirController,
                decoration: const InputDecoration(
                  label: Text("Tanggal Lahir"),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                  if (date != null) {
                    String formattedDate =
                        "${date.day}-${date.month}-${date.year}";
                    _tglLahirController.text = formattedDate;
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nimController.text.isNotEmpty &&
                    _namaController.text.isNotEmpty &&
                    _alamatController.text.isNotEmpty &&
                    _jenisKelaminController.text.isNotEmpty &&
                    _tglLahirController.text.isNotEmpty) {
                  Anggota anggota = Anggota(
                    nim: int.parse(_nimController.text),
                    nama: _namaController.text,
                    alamat: _alamatController.text,
                    jenisKelamin: _jenisKelaminController.text,
                    tglLahir: _tglLahirController.text,
                  );
                  HelperDB.instance.insertAnggota(anggota);
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
