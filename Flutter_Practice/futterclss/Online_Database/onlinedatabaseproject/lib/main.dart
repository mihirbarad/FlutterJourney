import 'package:flutter/material.dart';
import 'package:onlinedatabaseproject/Homepage.dart';
import 'package:onlinedatabaseproject/commentApi.dart';
import 'package:onlinedatabaseproject/imageApi.dart';
import 'package:onlinedatabaseproject/insert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommentApi(),
    );
  }
}
