import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Text(args['nim'].toString()),
          Text(args['nama']),
          Text(args['alamat']),
          Text(args['jenisKelamin']),
          Text(args['tglLahir']),
        ],
      ),
    );
  }
}
