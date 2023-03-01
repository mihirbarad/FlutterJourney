import 'package:divine_task/Screen/SportList.dart';
import 'package:divine_task/Screen/matcheslist.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slide_switcher/slide_switcher.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({super.key});

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  int switcherIndex1 = 0;
  bool? Colos = true;
  List textView = [
    'Sports',
    'Matches',
    'Upcoming',
    'Live',
  ];

  List pageview = [
    SportList(),
    MatchList(),
    Image.network(
        'https://img.freepik.com/free-vector/abstract-coming-soon-halftone-style-background-design_1017-27282.jpg'),
    Image.network(
        'https://img.freepik.com/free-vector/abstract-coming-soon-halftone-style-background-design_1017-27282.jpg'),
  ];

  void changePage(int index) {
    setState(() {
      switcherIndex1 = index;
      print(switcherIndex1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SlideSwitcher(
            containerBorderRadius: 120,
            initialIndex: switcherIndex1,
            containerColor: Color.fromARGB(255, 251, 241, 238),
            containerBorder:
                Border.all(width: 1, color: Color.fromARGB(255, 245, 160, 141)),
            slidersGradients: [
              LinearGradient(
                colors: [Color(0xFFf4a58a), Color(0xFFed7053)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ],
            children: [
              Text(
                'Sports',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: switcherIndex1 == 0
                        ? Colors.white
                        : Color.fromARGB(255, 120, 119, 119)),
              ),
              Text(
                'Matches',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: switcherIndex1 == 1
                        ? Colors.white
                        : Color.fromARGB(255, 120, 119, 119)),
              ),
              Text(
                'Upcoming',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: switcherIndex1 == 2
                        ? Colors.white
                        : Color.fromARGB(255, 120, 119, 119)),
              ),
              Text(
                'Live',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: switcherIndex1 == 3
                        ? Colors.white
                        : Color.fromARGB(255, 120, 119, 119)),
              ),
            ],
            indents: 7,
            onSelect: changePage,
            containerHeight: 65,
            containerWight: 100.w,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.9,
            child: pageview.elementAt(switcherIndex1),
          ),
        ],
      ),
    );
  }
}
