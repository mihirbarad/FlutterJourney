import 'dart:convert';

import 'package:apiexmaple/vimalApi/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class otp_apiexample extends StatefulWidget {
  const otp_apiexample({super.key});

  @override
  State<otp_apiexample> createState() => _otp_apiexampleState();
}

class _otp_apiexampleState extends State<otp_apiexample> {
  Future<OtpModel> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://sparrowgroups.com/mahadevpan/Apis/cat_pro_list.php"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return OtpModel.fromJson(data);
    } else {
      return OtpModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("api Fetch Exmaple"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<OtpModel>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.city?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Text("(${snapshot.data?.city![index].id})"),
                          Text(
                            "${snapshot.data?.city![index].categoryName}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 75, 24, 9)),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {}
              return Center(
                child: Text("Loding...."),
              );
            },
          )),
        ],
      ),
    );
  }
}
