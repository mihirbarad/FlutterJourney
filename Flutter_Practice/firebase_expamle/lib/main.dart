import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_expamle/26/grived.dart';
import 'package:firebase_expamle/flrebase/homepage.dart';
import 'package:firebase_expamle/flutterwithOs/homepage.dart';
import 'package:firebase_expamle/flutterwithOs/sms.dart';
import 'package:firebase_expamle/flutterwithOs/url.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(debugShowCheckedModeBanner: false, home: Gridview());
    });
  }
}
