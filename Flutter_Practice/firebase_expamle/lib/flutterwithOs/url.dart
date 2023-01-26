import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class url extends StatefulWidget {
  const url({super.key});

  @override
  State<url> createState() => _urlState();
}

class _urlState extends State<url> {
  String selected = "c language";
  var subject = ['c language', 'php', 'java', 'C#'];
  var urls = [
    'https://mail.google.com/mail/u/0/#inbox',
    'https://www.google.co.in/',
    'https://mail.google.com/mail/u/0/#inbox',
    'https://www.google.co.in/',
  ];
  var click;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: selected,
              icon: Icon(Icons.arrow_circle_down_sharp),
              items: subject.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  const url =
                      'https://console.firebase.google.com/project/otpexmaple/authentication/users';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Text("click")),
          ],
        ),
      ),
    );
  }
}
