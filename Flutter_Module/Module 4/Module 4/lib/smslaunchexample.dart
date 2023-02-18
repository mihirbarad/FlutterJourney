import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Smslaunch extends StatefulWidget {
  const Smslaunch({super.key});

  @override
  State<Smslaunch> createState() => _SmslaunchState();
}

class _SmslaunchState extends State<Smslaunch> {
  @override
  var sms = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: sms,
            decoration: InputDecoration(
              hintText: "sms",
            ),
          ),
          ElevatedButton(
            child: Text("Send Sms"),
            onPressed: () async {
              var url = Uri.parse("sms:${sms.text.toString()}");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw "invalid url";
              }
            },
          )
        ],
      ),
    );
  }
}
