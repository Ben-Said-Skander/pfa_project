// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pfa_application_1/screens/add_medicine.dart';
import 'package:pfa_application_1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddMedicine(),
    );
  }
}
