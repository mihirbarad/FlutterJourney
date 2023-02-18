import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Myphonecall extends StatefulWidget {
  const Myphonecall({super.key});

  @override
  State<Myphonecall> createState() => _MyphonecallState();
}

class _MyphonecallState extends State<Myphonecall> {
  @override
  var call = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone call"),),
      body: Column(
        children: [TextFormField(
          controller: call,
          decoration: InputDecoration(
            hintText: "phone nmbr",
          
          ),
        ),
          ElevatedButton(onPressed: (){
            launch("tel://${call.text.toString()}");
          }, child: Text("Call")),
        ],
      ),
    );
  }
}