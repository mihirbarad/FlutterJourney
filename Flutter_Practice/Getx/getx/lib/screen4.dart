import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/logic.dart';

class screen4 extends StatelessWidget {
  screen4({super.key});

  MainLogic mainLogic = Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: Text("Value ${mainLogic.count.toString()}"),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mainLogic.updateCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
