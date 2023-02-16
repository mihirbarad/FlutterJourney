import 'package:flutter/material.dart';
import 'package:project/eight.dart';
import 'package:project/fifth.dart';
import 'package:project/first.dart';
import 'package:project/fourth.dart';
import 'package:project/nine.dart';
import 'package:project/second.dart';
import 'package:project/seven.dart';
import 'package:project/sixth.dart';
import 'package:project/third.dart';
void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionTwo(),
    );
  }
}