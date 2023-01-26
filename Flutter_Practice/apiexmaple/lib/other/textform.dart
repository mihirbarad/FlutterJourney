import 'package:flutter/material.dart';

Widget myTextfiled(String labaltext, bool status, IconData icon,
    TextEditingController controllerr) {
  return Container(
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(8),
    child: TextField(
      controller: controllerr,
      obscureText: status,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labaltext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
