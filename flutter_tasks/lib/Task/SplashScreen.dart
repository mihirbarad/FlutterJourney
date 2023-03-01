import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/Task/Main_Screen.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Main_page())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: Center(child: Image.asset('assets/Inbox.png'))));
  }
}
