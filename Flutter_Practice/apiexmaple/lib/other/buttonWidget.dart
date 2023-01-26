import 'package:flutter/material.dart';

Widget mybutton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.brown),
      alignment: Alignment.center,
      child: Text(
        "Login ",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
