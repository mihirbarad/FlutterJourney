import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final String textToDisplay = 'Hello World';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(text: textToDisplay),
              ),
            );
          },
          child: Text('Go to second screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String text;

  SecondScreen({ required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}