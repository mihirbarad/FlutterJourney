import 'package:apiexmaple/Screens/messeges.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFFCA5FDA), Color(0xFFFFCFAA)])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.menu,
                    size: 4.h,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xFFBEBEBE),
                          offset: Offset(10, 10),
                          blurRadius: 35,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-10, -10),
                          blurRadius: 55,
                          spreadRadius: 1,
                        ),
                      ]),
                ),
              ),
              Container(
                width: 50.w,
                padding: EdgeInsets.all(8),
                child: Text(
                  "XYZ Socity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 134, 80, 61),
                      fontWeight: FontWeight.w600),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xFFBEBEBE),
                        offset: Offset(10, 10),
                        blurRadius: 35,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-10, -10),
                        blurRadius: 55,
                        spreadRadius: 1,
                      ),
                    ]),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Messeges(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Badge(
                      badgeContent: Text('3'),
                      child: Icon(
                        Icons.message,
                        size: 4.h,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0xFFBEBEBE),
                            offset: Offset(10, 10),
                            blurRadius: 35,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-10, -10),
                            blurRadius: 55,
                            spreadRadius: 1,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
