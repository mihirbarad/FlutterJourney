import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 12.h,
            ),
            child: Container(
              child: Center(child: Image.asset('assets/Onoarding -1.png')),
              height: 55.h,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              child: Image.asset(
                'assets/Rectangle 287.png',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 63.h, left: 13.w),
            child: Container(
              child: Text(
                "A sports social media app,\n united against hate",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 77.h, left: 15.w),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Our mission is to remove hatred, racism\n and online abuse from social media.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
