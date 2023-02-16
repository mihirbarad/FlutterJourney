import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/loginMODEL.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/googleSinin/auth_service.dart';
import 'package:topsBudget/otp.dart';

class Login extends StatefulWidget {
  var ipa4;
  var ipa6;
  Login({super.key, required this.ipa4, required this.ipa6});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _nameValidator = false;
  bool _numberValidator = false;
  var _servies = Myservices();
  var phone;
  var curentDate;
  var curenttime;

  fetchData() {
    //----------------------------------------------------//
    curentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    curenttime = DateFormat("hh-mm").format(DateTime.now());
    print(">>>>>>>>>${curentDate}");
    print(">>>>>>>>>${curenttime}");
  }

  //Firebase In Firestore Data Inis..
  void addDataToFirestore({String? name, String? Monumber}) async {
    // Collection reference
    CollectionReference usersCollection = _firestore.collection('users');

    // Document data to be added
    Map<String, dynamic> data = {
      'name': name,
      'number': Monumber,
      'LoginDate': curentDate,
      'LoginTime': curenttime,
      'ip Adrees4': widget.ipa4,
      'ip adress6': widget.ipa6,
    };

    // Adding document to Firestore
    await usersCollection.add(data);
  }

  @override
  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
                height: 15.h,
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
                      color: Color.fromARGB(255, 65, 66, 67).withOpacity(0.3),
                      spreadRadius: 1,
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
                      var nums = _numberController.text.toString();
                      print("--->>>${phone}<<<<----");
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${_numberController.text.toString()}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          addDataToFirestore(
                              name: _nameController.text, Monumber: nums);
                          phone = verificationId;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => otp(
                                        name: _nameController.text.toString(),
                                        phones: phone,
                                        mobileNumber: nums,
                                      )));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   minimumSize: Size(38.w, 4.8.h),
                  //   primary: Color.fromARGB(248, 178, 146, 42),
                  //   shape: BeveledRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(6))),
                  // ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80.w, 5.5.h),
                    primary: Color.fromARGB(248, 159, 109, 0),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                "Or",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                  margin: EdgeInsets.only(right: 5.w, left: 5.w),
                  child: ElevatedButton(
                    onPressed: () {
                      AuthService().SignInWithGoogle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Signin With Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.w, 5.5.h),
                      primary: Color.fromARGB(255, 240, 240, 240),

                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      //  shadowColor: Color.fromARGB(255, 6, 136, 197),
                    ),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  margin: EdgeInsets.only(right: 5.w, left: 5.w),
                  child: ElevatedButton(
                    onPressed: () {
                      AuthService().SignInWithGoogle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://e7.pngegg.com/pngimages/991/568/png-clipart-facebook-logo-computer-icons-facebook-logo-facebook-thumbnail.png',
                          height: 4.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Signin With Facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.w, 5.5.h),
                      primary: Color.fromARGB(255, 240, 240, 240),

                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      //  shadowColor: Color.fromARGB(255, 6, 136, 197),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
