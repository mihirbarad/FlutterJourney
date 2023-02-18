import 'package:flutter/material.dart';
import 'package:flutterwithos/Navigation_drawer/dashboard.dart';
import 'package:flutterwithos/animation.dart';
import 'package:flutterwithos/chart.dart';
import 'package:flutterwithos/datepickerexample.dart';
import 'package:flutterwithos/digitalsociety.dart';
import 'package:flutterwithos/dropdownintextfield.dart';
import 'package:flutterwithos/dropdownmenu.dart';
import 'package:flutterwithos/gridview.dart';
import 'package:flutterwithos/loginpage.dart';
import 'package:flutterwithos/phonecallingexample.dart';
import 'package:flutterwithos/smslaunchexample.dart';
import 'package:flutterwithos/urlview.dart';
import 'package:sizer/sizer.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer( builder: (context, orientation, deviceType){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:Chart_Map() );}
    );
  }
}