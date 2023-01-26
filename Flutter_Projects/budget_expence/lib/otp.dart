import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/main.dart';

class otp extends StatefulWidget {
  var phones;
  var name;
  otp({super.key, required this.phones, required this.name});

  @override
  State<otp> createState() => _homepageState();
}

class _homepageState extends State<otp> {
  var _otpController = TextEditingController();
  var errorController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var currentText;
  var ot = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 5, 37, 134),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter OTP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: Color.fromARGB(255, 108, 84, 12)),
            ),
            Text(
              "Here",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Color.fromARGB(255, 108, 84, 12)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: PinCodeTextField(
                length: 6,

                obscureText: false,
                controller: _otpController,
                animationType: AnimationType.slide,
                animationDuration: Duration(milliseconds: 500),
                errorAnimationController: errorController, // Pass it here
                onChanged: (value) {
                  setState(() {
                    ot = value;
                  });
                },
                appContext: context,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(25.w, 5.h),
                  primary: Color.fromARGB(248, 155, 134, 64),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.phones, smsCode: ot);

                    await auth.signInWithCredential(credential);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool("isLogin", true);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepage(
                                  person_Name: widget.name,
                                )),
                        (route) => false);

                    flutterLocalNotificationsPlugin.show(
                        0,
                        "Welcome ${widget.name} ",
                        "enjoy it.",
                        NotificationDetails(
                            android: AndroidNotificationDetails(
                                channel.id, channel.name,
                                channelDescription: channel.description,
                                importance: Importance.high,
                                color: Colors.blue,
                                playSound: true,
                                icon: '@mipmap/ic_launcher')));
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "Try OTP",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text("Done")),
          ],
        ),
      ),
    );
    // Column(
    //   children: [

    //     TextFormField(
    //         onChanged: ((value) {
    //           ot = value;
    //         }),
    //         controller: _otpController,
    //         keyboardType: TextInputType.number,
    //         decoration: InputDecoration(
    //             labelText: "whatever you want",
    //             hintText: "whatever you want",
    //             icon: Icon(Icons.output))),
    //     ElevatedButton(
    //         onPressed: () async {
    //           try {
    //             PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //                 verificationId: widget.phones, smsCode: ot);

    //             await auth.signInWithCredential(credential);
    //             Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => Homepage()),
    //                 (route) => false);
    //           } catch (e) {
    //             Fluttertoast.showToast(
    //                 msg: "Try OTP",
    //                 gravity: ToastGravity.BOTTOM,
    //                 backgroundColor: Colors.red,
    //                 textColor: Colors.white,
    //                 fontSize: 16.0);

    //             print("8469820697");
    //           }
    //         },
    //         child: Text("ook")),
    //   ],
    // ),
  }
}
