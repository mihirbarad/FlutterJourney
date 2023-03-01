import 'package:flutter/material.dart';
import 'package:flutter_tasks/Task/login_page/loginpage.dart';

import 'package:flutter_tasks/Task/page/Screen1.dart';
import 'package:flutter_tasks/Task/page/Screen2.dart';
import 'package:flutter_tasks/Task/page/Screen3.dart';
import 'package:flutter_tasks/Task/register_page/register.dart';

// Construct Dots Indicator

class Main_page extends StatefulWidget {
  const Main_page({Key? key}) : super(key: key);

  @override
  State<Main_page> createState() => Main_pageState();
}

class Main_pageState extends State<Main_page> {
  final PageController pgcontroller = PageController(initialPage: 0);

  int livepage = 0;
  final List<Widget> _pages = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    Register_Page()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pgcontroller.addListener(() {
      if (pgcontroller.page == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register_Page(),
            ));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pgcontroller,
            onPageChanged: (int page) {
              setState(() {
                livepage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              pgcontroller.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: livepage == index
                                  ? Color.fromARGB(255, 17, 59, 58)
                                  : Color.fromARGB(255, 248, 248, 248),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
