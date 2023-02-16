import 'package:assignment2/eight.dart';
import 'package:assignment2/fifth.dart';
import 'package:assignment2/fourth.dart';
import 'package:assignment2/nine.dart';
import 'package:assignment2/one.dart';
import 'package:assignment2/third.dart';
import 'package:assignment2/two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Nine(),  );
  }
}
