import 'dart:js';

import 'package:biodata_siswa/views/detail_page.dart';
import 'package:biodata_siswa/views/index_page.dart';
import 'package:biodata_siswa/views/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => IndexPage(),
        '/register': (context) => RegisterPage(),
        'details': (context) => DetailsPage(),
      },
    ),
  );
}
