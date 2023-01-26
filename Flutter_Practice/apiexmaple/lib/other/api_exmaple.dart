// import 'dart:async';
// import 'dart:convert';

// import 'package:apiexmaple/api_model.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class NewsListPage extends StatefulWidget {
//   @override
//   _NewsListPageState createState() => _NewsListPageState();
// }

// class _NewsListPageState extends State<NewsListPage> {
//   Future<List<Article>> getData(String newsType) async {
//     List<Article> list;
//     String link = "https://dummyjson.com/products";
//     var res = await http
//         .get(Uri.parse(link), headers: {"products": "application/json"});
//     print(res.body);
//     if (res.statusCode == 200) {
//       var data = json.decode(res.body);
//       var rest = data["products"] as List;
//       print(rest);
//       list = rest.map<Article>((json) => Article.fromJson(json)).toList();
//     }
//     //  print("List Size: ${list.length}");
//     return list;
//   }

//   Widget listViewWidget(List<Article> article) {
//     return Container(
//       child: ListView.builder(
//           itemCount: 20,
//           padding: const EdgeInsets.all(2.0),
//           itemBuilder: (context, position) {
//             return Card(
//               child: ListTile(
//                 title: Text(
//                   '${article[position].products}',
//                   style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             );
//           }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: FutureBuilder(
//           future: getData(widget.newsType),
//           builder: (context, snapshot) {
//             return snapshot.data != null
//                 ? listViewWidget(snapshot.data)
//                 : Center(child: CircularProgressIndicator());
//           }),
//     );
//   }
// }
