import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wanbuffor_task/model/class_model.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<ClassModel>> fetchApiData() async {
    final response =
        await http.get(Uri.parse("https://omahat.net/rest/V1/omahat/home/0"));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      List<ClassModel> cartList =
          list.map((e) => ClassModel.fromJson(e)).toList();

      return cartList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  late Future<List<ClassModel>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 73, 73, 73),
              size: 30,
            )),
        actions: [Icon(Icons.card_travel_outlined)],
        title: Text(
          'Omahat',
          style: TextStyle(
              color: Color.fromARGB(255, 29, 204, 235),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<ClassModel>>(
              future: fetchApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ClassModel> mylist = snapshot.data!;
                  return ListView.builder(
                    itemCount: mylist.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CarouselSlider.builder(
                              itemCount: mylist[index].model!.slider!.length,
                              itemBuilder: (BuildContext context, int positons,
                                      int pageViewIndex) =>
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${mylist[index].model!.slider![positons].imageUrl}'))),
                                  ),
                              options: CarouselOptions(
                                height: 250,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              )),
                          Container(
                            height: 140,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  mylist[index].model!.categories!.length,
                              itemBuilder: (context, rows) {
                                return Container(
                                    width: 120,
                                    margin: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(
                                        '${mylist[index].model!.categories![rows].imageUrl}',
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 110),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color.fromARGB(
                                                255, 8, 175, 175),
                                            child: Text(
                                              "${mylist[index].model!.categories![rows].name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "_________________",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 20, 165, 209)),
                              ),
                              Text(
                                "   Future Catagories  ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "_________________",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 20, 165, 209)),
                              ),
                            ],
                          ),
                          Container(
                            height: 140,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: mylist[index]
                                  .model!
                                  .featuredcategories!
                                  .length,
                              itemBuilder: (context, futureindex) {
                                return Container(
                                    width: 120,
                                    margin: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(
                                        '${mylist[index].model!.featuredcategories![futureindex].imageUrl}',
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 110),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color.fromARGB(
                                                255, 8, 175, 175),
                                            child: Text(
                                              "${mylist[index].model!.featuredcategories![futureindex].name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "_________________",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 20, 165, 209)),
                              ),
                              Text(
                                "   What's New  ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "_________________",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 20, 165, 209)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 450,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount:
                                    mylist[index].model!.newproducts!.length,
                                itemBuilder: (BuildContext ctx, gridIndex) {
                                  return Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 180,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 1,
                                          )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 50),
                                                child: Image.network(
                                                  '${mylist[index].model!.newproducts![gridIndex].imageUrl}',
                                                  height: 50,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70),
                                                child: Image.asset(
                                                  'assets/heart.png',
                                                  height: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 200),
                                            child: Text("Acbde"),
                                          ),
                                        ),
                                        Center(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 220),
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 233, 215, 58),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Add Cart',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )))),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {}
                return Center(child: CircularProgressIndicator());
              },
            )),
      ),
    );
  }
}
