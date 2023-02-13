// import 'dart:convert';
// import 'dart:math';

// import 'package:apiexmaple/Screens/homepages.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class sendDat extends StatefulWidget {
//   const sendDat({super.key});

//   @override
//   State<sendDat> createState() => sendDatState();
// }

// class sendDatState extends State<sendDat> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController contectController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   var _passwordVisible;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _passwordVisible = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 110,
//               ),
//               Text(
//                 "SignUp Data",
//                 style: TextStyle(
//                     fontSize: 38,
//                     color: Colors.brown,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: nameController,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(255, 45, 36, 8),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     focusColor: Colors.white,
//                     //add prefix icon
//                     prefixIcon: Icon(
//                       Icons.person_outline_rounded,
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     fillColor: Colors.grey,

//                     hintText: "Name",

//                     //make hint text
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),

//                     //create lable
//                     labelText: 'Enter Member Name',
//                     //lable style
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: emailController,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(255, 45, 36, 8),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     focusColor: Colors.white,
//                     //add prefix icon
//                     prefixIcon: Icon(
//                       Icons.email,
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     fillColor: Colors.grey,

//                     hintText: "email",

//                     //make hint text
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),

//                     //create lable
//                     labelText: 'Enter email address',
//                     //lable style
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: !_passwordVisible,
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(255, 45, 36, 8),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _passwordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.brown,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _passwordVisible = !_passwordVisible;
//                         });
//                       },
//                     ),
//                     focusColor: Colors.white,
//                     //add prefix icon
//                     prefixIcon: Icon(
//                       Icons.lock,
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     fillColor: Colors.grey,

//                     hintText: "Password",

//                     //make hint text
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),

//                     //create lable
//                     labelText: 'Enter Password',
//                     //lable style
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: contectController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 10,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(255, 45, 36, 8),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     focusColor: Colors.white,
//                     //add prefix icon
//                     prefixIcon: Icon(
//                       Icons.call,
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     fillColor: Colors.grey,

//                     hintText: "contect",

//                     //make hint text
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),

//                     //create lable
//                     labelText: 'Enter contact no',
//                     //lable style
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: addressController,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(255, 45, 36, 8),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: InputDecoration(
//                     focusColor: Colors.white,
//                     //add prefix icon
//                     prefixIcon: Icon(
//                       Icons.home,
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),

//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     fillColor: Colors.grey,

//                     hintText: "address",

//                     //make hint text
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),

//                     //create lable
//                     labelText: 'Block no',
//                     //lable style
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontFamily: "verdana_regular",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.brown),
//                       // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
//                       minimumSize: MaterialStateProperty.all(Size(380, 45)),
//                       textStyle:
//                           MaterialStateProperty.all(TextStyle(fontSize: 16))),
//                   onPressed: () {
//                     if (nameController == "1" &&
//                         emailController == "1" &&
//                         passwordController == "1" &&
//                         contectController == "1" &&
//                         addressController == "1") {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomPage(),
//                           ));
//                     } else {
//                       sendData();
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomPage(),
//                           ),
//                           (route) => false);
//                     }
//                   },
//                   child: Text("Save"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<http.Response> sendData() async {
//     var url = Uri.parse("https://digitalsocity.000webhostapp.com/asd.php");
//     var payload = {
//       'student_name': nameController.text.toString(),
//       'student_email': emailController.text.toString(),
//       'student_contact': contectController.text.toString(),
//       'student_password': passwordController.text.toString(),
//       'student_address': addressController.text.toString(),
//     };
//     var response = await http.post(url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(payload));
//     print("Payload: ${payload}");
//     if (response.statusCode == 200) {
//       print("data send");
//     } else {
//       print("faild data");
//     }
//     return response;
//   }
// }
