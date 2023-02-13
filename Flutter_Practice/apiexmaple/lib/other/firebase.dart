// import 'dart:async';

// import 'package:apiexmaple/other/buttonWidget.dart';
// import 'package:apiexmaple/other/logic/main_logic.dart';
// import 'package:apiexmaple/other/register.dart';
// import 'package:apiexmaple/other/textform.dart';
// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   var nameController = TextEditingController();
//   var passwordController = TextEditingController();

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Firebase Exmaple"),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           // Padding(
//           //   padding: EdgeInsets.all(15),
//           //   child: TextField(
//           //     controller: nameController,
//           //     decoration: InputDecoration(
//           //       errorBorder: InputBorder.none,
//           //       errorText: nameValidator ? "wrong" : null,
//           //       border: OutlineInputBorder(),
//           //       labelText: 'User Name',
//           //       hintText: 'Enter Your Name',
//           //     ),
//           //   ),
//           // ),
//           // Padding(
//           //   padding: EdgeInsets.all(15),
//           //   child: TextField(
//           //     obscureText: true,
//           //     controller: passwordController,
//           //     decoration: InputDecoration(
//           //       suffixIcon: IconButton(
//           //           onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
//           //       errorText: passwordValidator ? "wrong" : null,
//           //       border: OutlineInputBorder(),
//           //       labelText: 'User Password',
//           //       hintText: 'Enter Password',
//           //     ),
//           //   ),
//           // ),
//           myTextfiled(
//             "name",
//             false,
//             Icons.email,
//             nameController,
//           ),
//           myTextfiled("password", true, Icons.password, passwordController),
//           //  mybutton(),
//           ElevatedButton(
//               onPressed: () {
//                 Login(nameController.text.toString(),
//                         passwordController.text.toString())
//                     .then((result) {
//                   if (result == null) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => register(),
//                         ));
//                   }
//                 });
//               },
//               child: Text("Login")),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => register(),
//                   ));
//             },
//             child: Center(
//               child: Text("New user register click here"),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
