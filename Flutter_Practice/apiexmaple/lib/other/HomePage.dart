// // // import 'dart:convert';

// // // import 'package:apiexmaple/datamodel.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;

// // // class HomePage extends StatefulWidget {
// // //   const HomePage({super.key});

// // //   @override
// // //   State<HomePage> createState() => _HomePageState();
// // // }

// // // Future<List<ComentModel>> fetchdata() async {
// // //   final response = await http.get(Uri.parse('https://dummyjson.com/products'));
// // //   if (response.statusCode == 200) {
// // //     // Map<String, dynamic> data =
// // //     //     new Map<String, dynamic>.from(json.decode(response.body));

// // //     print(data['name']);
// // //     //  return jsonResponse.map((data) => new ComentModel.fromJson(data)).toList();
// // //   } else {
// // //     throw Exception("Fails To load");
// // //   }
// // // }

// // // class _HomePageState extends State<HomePage> {
// // //   late Future<List<ComentModel>> myfutureList;
// // //   @override
// // //   void initState() {
// // //     // TODO: implement initState
// // //     super.initState();
// // //     myfutureList = fetchdata();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SafeArea(
// // //           child: FutureBuilder<List<ComentModel>>(
// // //         future: myfutureList,
// // //         builder: (context, snapshot) {
// // //           if (snapshot.hasData) {
// // //             List<ComentModel> mylist = snapshot.data!;

// // //             return ListView.builder(
// // //                 itemCount: mylist.length,
// // //                 itemBuilder: (context, index) {
// // //                   return Container(
// // //                     margin: EdgeInsets.all(10),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.amber,
// // //                       borderRadius: BorderRadius.circular(30),
// // //                     ),
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(15),
// // //                       title: Text(
// // //                         "(${mylist[index].id})  " +
// // //                             "${mylist[index].title?.toUpperCase()}.",
// // //                         style: TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.w600,
// // //                             wordSpacing: 3),
// // //                       ),
// // //                       subtitle: Text("${mylist[index].description}"),
// // //                     ),
// // //                   );
// // //                 });
// // //           } else if (snapshot.hasError) {}
// // //           return CircularProgressIndicator();
// // //         },
// // //       )),
// // //     );
// // //   }
// // // }

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class news extends StatefulWidget {
//   news({Key? key}) : super(key: key);

//   @override
//   State<news> createState() => _brandState();
// }

// class _brandState extends State<news> {
//   List<String> idArray = [];

//   List<String> descriptionArray = [];
//   List<String> titleArray = [];
//   List<String> stockArray = [];

//   late Future myfuture;
//   @override
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     myfuture = getInfo();
//   }

//   Future<void> getInfo() async {
//     try {
//       final response =
//           await http.get(Uri.parse('https://dummyjson.com/products'));
//       if (response.statusCode == 200) {
//         Map data = json.decode(response.body);
//         List data1 = data['products'];

//         data1.map((e) {
//           // idArray.add(e['id']);
//           descriptionArray.add(e['description']);
//           titleArray.add(e['title']);
//           stockArray.add(e['stock'].toString());
//         }).toList();

//         return null;
//       } else {
//         throw Exception("Error");
//       }
//     } on SocketException catch (e) {
//       throw Exception("Error");
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: myfuture,
//           builder: (context, snapshot) =>
//               snapshot.connectionState == ConnectionState.waiting
//                   ? CircularProgressIndicator()
//                   : ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: idArray.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Colors.amber,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(15),
//                             title: Text(
//                               "${titleArray[index]}.",
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   wordSpacing: 3),
//                             ),
//                             subtitle: Text("${idArray[index]}"),
//                           ),
//                         );
//                         // Container(
//                         //   margin: EdgeInsets.symmetric(
//                         //       horizontal: MediaQuery.of(context).size.width / 15,
//                         //       vertical: MediaQuery.of(context).size.height / 80),
//                         //   decoration: BoxDecoration(
//                         //     color: Color(0xff128C7E),
//                         //     borderRadius: BorderRadius.circular(10),
//                         //   ),
//                         //   child: Center(
//                         //     child: Padding(
//                         //       padding: EdgeInsets.only(
//                         //           left: MediaQuery.of(context).size.width / 20,
//                         //           top: MediaQuery.of(context).size.height / 40,
//                         //           bottom: MediaQuery.of(context).size.height / 40),
//                         //       child: Center(
//                         //         child: Column(
//                         //           mainAxisAlignment: MainAxisAlignment.start,
//                         //           children: [
//                         //             Row(
//                         //               mainAxisAlignment: MainAxisAlignment.start,
//                         //               children: [
//                         //                 Expanded(
//                         //                   flex: 2,
//                         //                   child: Text(
//                         //                     " ${baddressArray[index]}",
//                         //                     style: TextStyle(
//                         //                         color: Colors.white,
//                         //                         fontSize: MediaQuery.of(context)
//                         //                                 .size
//                         //                                 .width /
//                         //                             26),
//                         //                   ),
//                         //                 ),
//                         //               ],
//                         //             ),
//                         //           ],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // );
//                       })),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
