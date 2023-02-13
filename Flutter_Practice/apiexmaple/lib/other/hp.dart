import 'package:apiexmaple/other/logic/main_logic.dart';
import 'package:apiexmaple/other/textform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HP extends StatefulWidget {
  const HP({super.key});

  @override
  State<HP> createState() => _HPState();
}

class _HPState extends State<HP> {
  var _seachController = TextEditingController();

  Map<String, dynamic>? usermap = Map();

  Future<void> searchValue() async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;

    await _fireStore
        .collection("users")
        .where("email", isEqualTo: _seachController.text)
        .get()
        .then((value) {
      setState(() {
        usermap = value.docs[0].data();
      });
      print(">>>>>>><<<<<>$usermap<<>>>><<");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usermap;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Logout(context);
        },
        child: Icon(Icons.logout),
      ),
      body: Column(children: [
        SizedBox(
          height: 120,
        ),
        myTextfiled(
          "EnterName",
          false,
          Icons.search,
          _seachController,
        ),
        IconButton(
            onPressed: () {
              searchValue();
            },
            icon: Icon(Icons.search)),
        usermap != null
            ? ListTile(
                onTap: () {},
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.deepOrange,
                  ),
                ),
                title: Text("${usermap!['name']}"),
                subtitle: Text("${usermap!['email']}"),
              )
            : Container(),
        // Container(
        //   padding: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //       color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        //   child: Text(
        //     "${usermap['name']}",
        //     style: TextStyle(fontSize: 30),
        //   ),
        // ),
      ]),
    );
  }
}
