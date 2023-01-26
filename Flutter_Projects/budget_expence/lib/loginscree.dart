import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/loginMODEL.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/googleSinin/auth_service.dart';
import 'package:topsBudget/otp.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  bool _nameValidator = false;
  bool _numberValidator = false;
  var _servies = Myservices();
  var phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                'images/icons8-money-bag-96.png',
              ),
              Text(
                "Tops Budget",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(248, 141, 115, 29),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: MediaQuery.of(context).size.height / 2.5,
                child: TextFormField(
                  controller: _nameController,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 14, 69, 83),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    errorText: _nameValidator ? "Enter Valid Text" : null,
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(248, 141, 115, 29),
                    ),

                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(248, 141, 115, 29),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(248, 255, 219, 99), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color.fromARGB(255, 123, 246, 255),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.height / 2.5,
                child: TextFormField(
                  onChanged: (value) {
                    phone = value;
                  },
                  controller: _numberController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 14, 69, 83),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    errorText: _numberValidator ? "Enter Valid Item" : null,
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: Icon(
                      Icons.call,
                      color: Color.fromARGB(248, 141, 115, 29),
                    ),

                    labelText: 'Mobile No',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(248, 141, 115, 29),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 67, 211), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color.fromARGB(248, 141, 115, 29),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 65, 66, 67).withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(5, 6),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _nameController.text.isEmpty
                          ? _nameValidator = true
                          : _nameValidator = false;
                      _numberController.text.isEmpty
                          ? _numberValidator = true
                          : _numberValidator = false;
                    });

                    if (_nameValidator == false && _numberValidator == false) {
                      print("--->>>${phone}<<<<----");
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${_numberController.text.toString()}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          phone = verificationId;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => otp(
                                        name: _nameController.text.toString(),
                                        phones: phone,
                                      )));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(38.w, 4.8.h),
                    primary: Color.fromARGB(248, 141, 115, 29),

                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    //  shadowColor: Color.fromARGB(255, 6, 136, 197),
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      AuthService().SignInWithGoogle();
                    },
                    child: ClipRect(
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                        height: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 28, 23, 10)),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  ClipRect(
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1200px-Facebook_Logo_%282019%29.png",
                      height: 40,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
