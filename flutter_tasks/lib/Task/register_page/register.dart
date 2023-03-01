import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_tasks/Task/login_page/loginpage.dart';

import 'package:sizer/sizer.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  String? validation(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'+/=?^_`{|}~-]+)|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])")@(?:(?:[a-z0-9](?:[a-z0-9-]'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160),
              const Text(
                "Let’s Get Started 😃",
                style: (TextStyle(
                    fontSize: 36,
                    color: Color(0xFF161F3D),
                    fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 3.h,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 80,
                        width: double.maxFinite,
                        child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              label: Text("Email"),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: validation),
                      ),
                      myTextField('Full Name', 'Full Name', true, Icons.person,
                          nameController, 'Full Name'),
                      myTextField('Enter Password', 'Enter passwod', true,
                          Icons.lock, passwordController, 'Enter password'),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "By Signing Up You agree to our",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Tearms and Conditions",
                        style: TextStyle(fontSize: 15),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 5, 111, 97),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xFF161F3D),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons8-facebook 1.png'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign Up with Facebook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a Member?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login_page(),
                            ));
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 17),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget myTextField(
    String hintText,
    String lableText,
    bool status,
    IconData icon,
    TextEditingController textEditingController,
    String validatortext) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 80,
    width: double.maxFinite,
    child: TextFormField(
      obscureText: status,
      validator: (value) {
        if (value!.isEmpty) return validatortext;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: lableText,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}
