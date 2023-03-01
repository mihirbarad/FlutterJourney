import 'package:flutter/material.dart';
import 'package:get/get.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("SCreen 2 "),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Click 1"))
        ],
      ),
    );
  }
}
