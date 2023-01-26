import 'dart:async';

import 'package:apiexmaple/Screens/homepages.dart';
import 'package:apiexmaple/other/buttonWidget.dart';
import 'package:apiexmaple/other/firebase.dart';
import 'package:apiexmaple/other/logic/main_logic.dart';
import 'package:apiexmaple/other/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _HomepageState();
}

class _HomepageState extends State<register> {
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool isloding = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Firebase Exmaple"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          // Padding(
          //   padding: EdgeInsets.all(15),
          //   child: TextField(
          //     controller: nameController,
          //     decoration: InputDecoration(
          //       errorBorder: InputBorder.none,
          //       errorText: nameValidator ? "wrong" : null,
          //       border: OutlineInputBorder(),
          //       labelText: 'User Name',
          //       hintText: 'Enter Your Name',
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(15),
          //   child: TextField(
          //     obscureText: true,
          //     controller: passwordController,
          //     decoration: InputDecoration(
          //       suffixIcon: IconButton(
          //           onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
          //       errorText: passwordValidator ? "wrong" : null,
          //       border: OutlineInputBorder(),
          //       labelText: 'User Password',
          //       hintText: 'Enter Password',
          //     ),
          //   ),
          // ),
          myTextfiled(
            "name",
            false,
            Icons.person,
            _usernameController,
          ),
          myTextfiled(
            "email",
            false,
            Icons.email,
            _emailController,
          ),
          myTextfiled("password", true, Icons.password, _passwordController),
          //  mybutton(),
          ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  //   setState(() {
                  //     isloding = true;
                  //   });
                  //   createAccount("AAAA", "flutterexample@gmail.com", "123456789")
                  //       .then((user) {
                  //     if (user != null) {
                  //       setState(() {
                  //         isloding = false;
                  //       });
                  //       print(">>>>>SigUp seccess<<<<<<");
                  //     }
                  //   });
                  // } else {
                  //   print("Please enter all filed");
                  // }
                  createAccount(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((result) {
                    if (result == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => register(),
                          ));
                    }
                  });
                }
              },
              child: Text("SignUp")),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ));
            },
            child: Center(
              child: Text("alredy user click here"),
            ),
          )
        ],
      )),
    );
  }
}
