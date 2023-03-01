import 'package:flutter/material.dart';

Widget myTextField(
    String hintText,
    String lableText,
    bool status,
    IconData icon,
    TextEditingController textEditingController,
    String validatortext) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 80,
    width: double.maxFinite,
    child: TextFormField(
      obscureText: status,
      validator: (value) {
        if (value!.isEmpty) return validatortext;
      },
      decoration: InputDecoration(
        suffix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.remove_red_eye),
        ),
        hintText: hintText,
        labelText: lableText,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}
