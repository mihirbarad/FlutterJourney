import 'dart:convert';

import 'package:apiexmaple/json_parsing/product_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class JsonViews extends StatefulWidget {
  const JsonViews({super.key});

  @override
  State<JsonViews> createState() => _JsonViewsState();
}

class _JsonViewsState extends State<JsonViews> {
  Future<ProductModels> getproductApi() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductModels.fromJson(data);
    } else {
      return ProductModels.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 40,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[
                  Color.fromARGB(255, 227, 150, 186),
                  Color.fromARGB(255, 170, 46, 104),
                ]),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 110,
        title: Text("Shoping Center"),
      ),
      body: Container(
        child: FutureBuilder<ProductModels>(
          future: getproductApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.products!.length ?? 0,
                itemBuilder: (context, index) {
                  String? pris = "${snapshot.data?.products![index].price}";
                  String? offer =
                      "${snapshot.data?.products![index].discountPercentage}";
                  double ratings = snapshot.data!.products![index].rating;

                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 240, 210, 223)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot
                                  .data!.products![index].images?.length,
                              itemBuilder: (context, positione) {
                                return AlertDialog(
                                  title: Image(
                                    image: NetworkImage(
                                      "${snapshot.data!.products![index].images![positione]}",
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(
                            "${snapshot.data?.products![index].thumbnail}",
                            fit: BoxFit.fitWidth,
                          ),
                          // Container(
                          //     height: MediaQuery.of(context).size.height / 4,
                          //     width: MediaQuery.of(context).size.width / 1,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       shrinkWrap: true,
                          //       itemCount: snapshot
                          //           .data!.products![index].images!.length,
                          //       itemBuilder: (context, position) {
                          //         return Container(
                          //           height: 120,
                          //           width: 120,
                          //           margin: EdgeInsets.all(10),
                          //           padding: EdgeInsets.all(10),
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             image: DecorationImage(
                          //                 image: NetworkImage(
                          //                   snapshot.data!.products![index]
                          //                       .images![position],
                          //                 ),
                          //                 fit: BoxFit.cover),
                          //           ),
                          //         );
                          //       },
                          //     )),
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Model: ${snapshot.data?.products![index].title}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 101, 35, 35),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$$pris",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 230, 228, 228),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "-$offer%",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 36, 153, 4),
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating: ratings,
                                        itemSize: 23,
                                        // minRating: ratings,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Color.fromARGB(255, 85, 65, 5),
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Text("${ratings.toString()}"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Model: ${snapshot.data?.products![index].description}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 101, 35, 35),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            contentPadding: EdgeInsets.only(right: 2),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              throw Exception("DataNot Found");
            } else {
              return Center(
                child: Text("Loading...."),
              );
            }
          },
        ),
      ),
    );
  }
}
