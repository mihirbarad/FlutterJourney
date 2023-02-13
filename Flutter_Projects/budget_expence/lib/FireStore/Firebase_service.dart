// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebasesModel {
//   final CollectionReference _postsCollectionReference =
//       Firestore.instance.collection('posts');

//   Future<void> addPost(Post post) {
//     return _postsCollectionReference.add({
//       'title': post.title,
//       'body': post.body,
//     });
//   }
// }

// class Post {
//   final String title;
//   final String body;

//   Post({required this.title, required this.body});
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // final _firestore = Firestore.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendData(Map<String, dynamic> data) async {
    await _firestore.collection('users').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("geeksforgeeks"),
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            sendData({"name": "John Doe", "number": '9033565474'});
          },
        ),
      ),
    );
  }
}
