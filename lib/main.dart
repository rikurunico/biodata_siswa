import 'package:biodata_siswa/views/detail_page.dart';
import 'package:biodata_siswa/views/new_index_page.dart';
import 'package:biodata_siswa/views/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // ignore: prefer_const_constructors
        '/': (context) => Dashboard(),
        '/detail': (context) => DetailsPage(),
        '/register': (context) => RegisterPage(),
      },
    ),
  );
}
