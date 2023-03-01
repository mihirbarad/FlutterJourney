import 'package:carousel_slider/carousel_slider.dart';
import 'package:divine_task/Screen/SliderMenu.dart';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Your Sports',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Container(
                height: 3.h,
                width: 18.w,
                //margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFf4a58a), Color(0xFFed7053)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: 0.5.w,
                    ),
                    Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          CarouselSlider(
            items: [
              Container(
                height: 25.h,
                width: double.maxFinite,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 246, 178, 156),
                        Color.fromARGB(255, 234, 101, 71)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 6.w),
                      child: Container(
                        height: 3.h,
                        width: 20.w,
                        //margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(104, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/football.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            Text(
                              'Football',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, left: 5.w),
                      child: Text(
                        'Football',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, left: 5.w),
                      child: Text(
                        'Champion League',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 5.w),
                      child: Text(
                        'Celebration',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h, left: 5.w),
                      child: Text(
                        'Tomorrow,06.30 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.h,
                width: double.maxFinite,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8ab4f4),
                        Color(0xFF4e8eed),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 6.w),
                      child: Container(
                        height: 3.h,
                        width: 20.w,
                        //margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(104, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/football.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            Text(
                              'Football',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, left: 5.w),
                      child: Text(
                        'Football',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, left: 5.w),
                      child: Text(
                        'Champion League',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 5.w),
                      child: Text(
                        'Celebration',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h, left: 5.w),
                      child: Text(
                        'Tomorrow,06.30 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25.h,
                width: double.maxFinite,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 221, 158, 245),
                        Color.fromARGB(255, 184, 61, 237),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 6.w),
                      child: Container(
                        height: 3.h,
                        width: 20.w,
                        //margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(104, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/football.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            Text(
                              'Football',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, left: 5.w),
                      child: Text(
                        'Football',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, left: 5.w),
                      child: Text(
                        'Champion League',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 5.w),
                      child: Text(
                        'Celebration',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h, left: 5.w),
                      child: Text(
                        'Tomorrow,06.30 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              height: 30.h,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
          ),
          SliderMenu()
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: ImageIcon(AssetImage("assets/menu.ttf")),
            title: Text('Menu'),
          ),
          FlashyTabBarItem(
            icon: ImageIcon(AssetImage("assets/alarm.png")),
            title: Text('Notification'),
          ),
          FlashyTabBarItem(
            icon: ImageIcon(AssetImage("assets/user.png")),
            title: Text('Person'),
          ),
        ],
      ),
    );
  }
}
