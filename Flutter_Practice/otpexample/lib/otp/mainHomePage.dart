import 'package:flutter/material.dart';

class HomepageMain extends StatefulWidget {
  const HomepageMain({super.key});

  @override
  State<HomepageMain> createState() => _HomepageMainState();
}

class _HomepageMainState extends State<HomepageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
    );
  }
}
