import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen2.dart';

class screen1 extends StatelessWidget {
  const screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar("Snackbar", "Gets Example");
        },
        child: Icon(Icons.abc),
      ),
      body: Column(
        children: [
          Text("SCreen 1 "),
          ElevatedButton(
              onPressed: () {
                Get.to(screen2());
              },
              child: Text("Click "))
        ],
      ),
    );
  }
}
