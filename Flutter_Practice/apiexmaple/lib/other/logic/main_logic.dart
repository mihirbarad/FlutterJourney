import 'package:firebase_auth/firebase_auth.dart';

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
Future createAccount({String? email, String? password}) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
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

Future Logout() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
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
