import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:image_games/homepage.dart';
import 'package:image_games/qustions/q2.dart';
import 'package:image_games/qustions/q3.dart';
import 'package:image_games/qustions/q4.dart';
import 'package:image_games/qustions/q5.dart';
import 'package:image_games/qustions/q6.dart';
import 'package:simple_timer/simple_timer.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class q5 extends StatefulWidget {
  int? r8;
  q5({super.key, @required this.r8});

  @override
  State<q5> createState() => _Guess1State();
}

class _Guess1State extends State<q5> {
  int r9 = 0;
  bool isLogoVisible = true;
  List _selectedIndexs = [];
  List qustion = [
    'A) Toyota',
    'B) Ferrari',
    'C) Mercedes',
    'D) Hyundai',
  ];
  List<int> score = [
    5,
    0,
    0,
    0,
  ];

  // instantiation

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => q6(
                    r10: r9,
                  ))));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Visibility(
                        visible: isLogoVisible,
                        child: Image.asset(
                          'assets/toyota.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final _isSelected = _selectedIndexs.contains(index);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              print(score[index]);
                              r9 = widget.r8! + score[index];
                              print(r9);
                              if (_isSelected) {
                                _selectedIndexs.remove(index);
                                print("is selected");
                              } else {
                                _selectedIndexs.add(index);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(top: 15, left: 30),
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration: BoxDecoration(
                                color: _isSelected
                                    ? Colors.red
                                    : Colors.indigo[900],
                                borderRadius: BorderRadius.circular(50),
                                // gradient: new LinearGradient(colors: [
                                //   Color.fromARGB(255, 61, 51, 144),
                                //   Color.fromARGB(255, 44, 28, 167),
                                // ]),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: Text(
                              qustion[index],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]))));
  }
}
