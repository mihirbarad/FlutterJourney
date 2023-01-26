import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api_send extends StatefulWidget {
  const api_send({super.key});

  @override
  State<api_send> createState() => _api_sendState();
}

class _api_sendState extends State<api_send> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name ",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    ">>>${nameController}<<<" + ">>>>>${emailController}<<<<<");

                sendData();
              },
              child: Text("Send "))
        ],
      ),
    ));
  }

  Future<http.Response> sendData() async {
    var url = Uri.parse('https://digitalsocity.000webhostapp.com/asd.php');
    var payload = {
      'name': nameController.text.toString(),
      'email': emailController.text.toString()
    };

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload));
    print("Payload: $payload");

    if (response.statusCode == 200) {
      print('Data sent successfully!');
    } else {
      print('Failed to send data.');
    }
    return response;
  }
}
