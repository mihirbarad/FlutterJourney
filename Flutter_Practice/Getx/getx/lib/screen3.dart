import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              barrierDismissible: false,
              title: "My dailog",
              content: Text("Are You sure you want continue"),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.done),
                    label: Text("Yes")),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.cancel),
                    label: Text("No"))
              ]);
        },
        child: Icon(Icons.stadium_rounded),
      ),
    );
  }
}
