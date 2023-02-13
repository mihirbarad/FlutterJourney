import 'package:apiexmaple/other/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
//get user => _auth.currentUser;

// Future createAccount(String email, String password) async {
//   try {
//     User? user = (await _auth.createUserWithEmailAndPassword(
//             email: email.trim(), password: password))
//         .user;

//     if (user != null) {
//       print("Account Create succ");
//       return user;
//     } else {
//       print("account creation failed");
//     }
//   } catch (e) {
//     print(">>>>>$e<<<");
//     throw Exception("Not created");
//     return null;
//   }
// }
Future<void> createAccount(
    {String? username, String? email, String? password}) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    ))
        .user;

    if (user != null) {
      await _firestore.collection("users").doc(_auth.currentUser!.uid).set({
        "name": username,
        "email": email,
        "status": "pending",
      });
    }
  } on FirebaseAuthException catch (e) {
    return null;
  }
}

Future Login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

Future Logout(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => register(),
          ));
    });
  } catch (e) {
    print(e);
  }
}




// class AuthenticationHelper {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   get user => _auth.currentUser;

//   //SIGN UP METHOD
//   Future signUp({String? email, String? password}) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email!,
//         password: password!,
//       );
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   //SIGN IN METHOD
//   Future signIn({String? email, String? password}) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//           email: email!, password: password!);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   //SIGN OUT METHOD
//   Future signOut() async {
//     await _auth.signOut();

//     print('signout');
//   }
// }
