import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertask/newtodolist/home.dart';
import 'package:fluttertask/screen/todoLIst.dart';
import 'package:sizer/sizer.dart';

import 'screen/slepshScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: SpleshScreen());
    });
  }
}
