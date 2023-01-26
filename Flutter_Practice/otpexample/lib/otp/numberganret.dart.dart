import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otpexample/otp/otppage.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var _numberController = TextEditingController();
  var phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Column(
        children: [
          TextFormField(
              onChanged: (value) {
                phone = value;
              },

              // controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "whatever you want",
                  hintText: "whatever you want",
                  icon: Icon(Icons.phone_iphone))),
          ElevatedButton(
              onPressed: () async {
                print("--->>>${phone}<<<<----");
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+91${phone}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    phone = verificationId;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => otp(
                                  phones: phone,
                                )));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: Text("sent")),
        ],
      ),
    );
  }
}
