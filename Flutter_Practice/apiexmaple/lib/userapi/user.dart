import 'dart:convert';

import 'package:apiexmaple/userapi/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  Future<UserModel> getUserData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      return UserModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "UserData",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 238, 217, 209),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<UserModel>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.users!.length,
                itemBuilder: (context, index) {
                  var snap = snapshot.data!.users![index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 217, 209)),
                    child: Column(
                      children: [
                        Image.network(
                          "${snapshot.data!.users![index].image}",
                          height: 80,
                        ),
                        Text(
                            "Name:  ${snapshot.data!.users![index].firstName}\t\t${snapshot.data!.users![index].maidenName}\t\t${snapshot.data!.users![index].lastName}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age: ${snapshot.data!.users![index].age}"),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                                "Gender: ${snapshot.data!.users![index].gender}"),
                          ],
                        ),
                        Text("Email: ${snapshot.data!.users![index].email}"),
                        Text("Phone: ${snapshot.data!.users![index].phone}"),
                        Text(
                            "Username: ${snapshot.data!.users![index].username}"),
                        Text(
                            "password: ${snapshot.data!.users![index].password}"),
                        Text(
                            "brithday: ${snapshot.data!.users![index].birthDate}"),
                        Text(
                            "BloodGroup: ${snapshot.data!.users![index].bloodGroup}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Height: ${snapshot.data!.users![index].height}"),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                                "Weight: ${snapshot.data!.users![index].weight}"),
                          ],
                        ),
                        Text(
                            "EyesColor: ${snapshot.data!.users![index].eyeColor}"),
                        Text(
                            "HairColor: ${snapshot.data!.users![index].hair!.color}"),
                        Text("Hair TYpe: ${snap.hair!.type}"),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {}
            return Center(
              child: Text("Loading..."),
            );
          },
        ),
      ),
    );
  }
}
