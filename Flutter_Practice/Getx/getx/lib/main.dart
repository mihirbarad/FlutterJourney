import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx/Screen1.dart';
import 'package:getx/logic.dart';
import 'package:getx/screen4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MainLogic obj = Get.put(MainLogic());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(useMaterial3: true), home: screen4());
  }
}
