import 'package:apiexmaple/Screens/homepages.dart';
import 'package:apiexmaple/other/firebase.dart';
import 'package:apiexmaple/other/hp.dart';
import 'package:apiexmaple/other/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authFire extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HP();
    } else {
      return register();
    }
  }
}
