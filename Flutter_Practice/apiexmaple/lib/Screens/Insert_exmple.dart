// import 'package:apiexmaple/Screens/homepages.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/material.dart';

// class ApiPost extends StatefulWidget {
//   const ApiPost({super.key});

//   @override
//   State<ApiPost> createState() => _ApiPostState();
// }

// class _ApiPostState extends State<ApiPost> {
//   var name = TextEditingController();
//   var email = TextEditingController();
//   var passwords = TextEditingController();
//   var contect = TextEditingController();

//   var address = TextEditingController();
//   var _passwordVisible;
//   var sendData;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _passwordVisible = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 130,
//         centerTitle: true,
//         backgroundColor: Colors.brown,
//         title: Text(
//           "SignUp Member",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(80),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: TextFormField(
//                   controller: name,
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
//                   controller: email,
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
//                   controller: passwords,
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
//                   controller: contect,
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
//                   controller: address,
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
//                   onPressed: () async {
//                     await postUserDetail();

//                     if (sendData == true) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomPage(),
//                           ));
//                     }
//                   },
//                   child: Text("Save"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> postUserDetail() async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://digitalsocity.000webhostapp.com/InsertApi.php'),
//         body: {
//           'sname': name.text.toString(),
//           'semail': email.text.toString(),
//           'spassword': passwords.text.toString(),
//           'scontact': contect.text.toString(),
//           'saddress': address.text.toString(),
//         },
//       ).then((value) async {
//         print("${name.text}" +
//             "${email.text}" +
//             "${passwords.text}" +
//             "${contect.text}" +
//             "${address.text}");
//         Map data = jsonDecode(value.body);
//         print(data['success'] == true);
//         sendData = true;

//         if (data['success'] == true) {
//           Fluttertoast.showToast(
//               msg: " Data Send",
//               gravity: ToastGravity.BOTTOM,
//               toastLength: Toast.LENGTH_LONG);
//         } else {
//           Fluttertoast.showToast(
//               msg: "${data['msg']}",
//               gravity: ToastGravity.BOTTOM,
//               toastLength: Toast.LENGTH_LONG);
//         }
//       }).catchError((e) {
//         return Fluttertoast.showToast(
//                 msg: "${e}",
//                 gravity: ToastGravity.BOTTOM,
//                 toastLength: Toast.LENGTH_LONG)
//             .then((value) => Navigator.pop(context));
//       });
//     } catch (e) {
//       Fluttertoast.showToast(
//           msg: "${e}",
//           gravity: ToastGravity.BOTTOM,
//           toastLength: Toast.LENGTH_LONG);
//     }
//   }
//   // Future<void> postUserDetail() async {
//   //   try {
//   //     final response = await http.post(
//   //       Uri.parse('https://digitalsocity.000webhostapp.com/InsertApi.php'),
//   //       body: {
//   //         'sname': name.text.toString(),
//   //         'semail': email.text.toString(),
//   //         'saddress': address.text.toString(),
//   //         'spassword': passwords.text.toString(),
//   //         'scontact': contect.text.toString(),
//   //       },
//   //     ).then((value) async {
//   //       Map data = jsonDecode(value.body);
//   //       print(".......>>>>>>...${data['success']}");
//   //       if (data['success']) {
//   //         Fluttertoast.showToast(
//   //             msg: "Login Success",
//   //             gravity: ToastGravity.BOTTOM,
//   //             toastLength: Toast.LENGTH_LONG);
//   //       }
//   //     });
//   //   } catch (e) {
//   //     Fluttertoast.showToast(
//   //         msg: "catch  Error",
//   //         gravity: ToastGravity.BOTTOM,
//   //         toastLength: Toast.LENGTH_LONG);
//   //   }
//   // }
// }
