import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

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
              child: Center(child: Image.asset('assets/onboarding_image3.png')),
              height: 50.h,
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
            padding: EdgeInsets.only(top: 63.h, left: 20.w),
            child: Container(
              child: Text(
                "Chat and post with\n other fans",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 77.h, left: 13.w),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Communicate with fellow fans on match\n day threads, articles and other social\n media posts.",
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
