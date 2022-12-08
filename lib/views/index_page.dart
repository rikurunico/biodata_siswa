import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BIODATA'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("NIM"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Nama"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Alamat"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Jenis Kelamin"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(10), child: TanggalLahir()),
            Container(
              child: ElevatedButton(
                onPressed: (() {}),
                child: Text("Simpan"),
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

              if (newDate == null) return;

              setState(() {
                selectedDate = newDate;
              });
            },
            child: Text('Select Date'),
          ),
        ],
      ),
    );
  }
}

// class TanggalLahirState extends State<TanggalLahir> {
//   DateTime selectedDate = DateTime.now();

//   Future<Null> selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
