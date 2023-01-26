import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class sms extends StatefulWidget {
  const sms({super.key});

  @override
  State<sms> createState() => _PhoneCallingState();
}

class _PhoneCallingState extends State<sms> {
  var sms = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SMS"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: sms,
                  decoration: InputDecoration(hintText: 'Enter sms'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var url = Uri.parse("sms:+91${sms.text.toString()}?body");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw "invalid url";
                    }
                  },
                  child: Text("SMS"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                ),
              ],
            ),
          ),
        ));
  }
}
