import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class urlView extends StatefulWidget {
  const urlView({super.key});

  @override
  State<urlView> createState() => _urlViewState();
}

class _urlViewState extends State<urlView> {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("URL"),),
      body: Column(
        children: [
          ElevatedButton( onPressed: () async {
      const url = 'https://flutter.dev';
      if(await canLaunch(url)){
        await launch(url);
      }
    }, child: Text("tap")),
        ],
      ),
    );
  }
}