import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otpexample/otp/mainHomePage.dart';

class otp extends StatefulWidget {
  var phones;
  otp({super.key, required this.phones});

  @override
  State<otp> createState() => _homepageState();
}

class _homepageState extends State<otp> {
  var _otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var ot = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Column(
        children: [
          TextFormField(
              onChanged: ((value) {
                ot = value;
              }),
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "whatever you want",
                  hintText: "whatever you want",
                  icon: Icon(Icons.output))),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.phones, smsCode: ot);

                  await auth.signInWithCredential(credential);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomepageMain()),
                      (route) => false);
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: "Try OTP",
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  print("8469820697");
                }
              },
              child: Text("ook")),
        ],
      ),
    );
  }
}
