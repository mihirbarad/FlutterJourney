import 'package:flutter/material.dart';

class Stackes extends StatefulWidget {
  const Stackes({super.key});

  @override
  State<Stackes> createState() => _StackesState();
}

class _StackesState extends State<Stackes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Exmple"),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
              height: 600,
              width: 600,
              child: Stack(
                children: [
                  Container(
                    height: 450,
                    width: 450,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    margin: EdgeInsets.only(top: 120, left: 100),
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(top: 10, left: 30),
                    color: Colors.pink,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
