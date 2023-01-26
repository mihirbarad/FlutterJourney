import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCalling extends StatefulWidget {
  const PhoneCalling({super.key});

  @override
  State<PhoneCalling> createState() => _PhoneCallingState();
}

class _PhoneCallingState extends State<PhoneCalling> {
  var mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calling pad"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: mobile,
                  decoration: InputDecoration(hintText: 'Enter Number'),
                ),
                ElevatedButton(
                  onPressed: () {
                    launch("tel://+91${mobile.text.toString()}");
                  },
                  child: Text("Call"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                ),
              ],
            ),
          ),
        ));
  }
}
