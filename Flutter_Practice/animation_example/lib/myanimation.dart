import 'package:flutter/material.dart';

class Myanimation extends StatefulWidget {
  const Myanimation({super.key});

  @override
  State<Myanimation> createState() => _MyanimationState();
}

class _MyanimationState extends State<Myanimation> {
  double _opacity = 1;
  double marginup = 0;
  double margindown = 0;
  double marginleft = 0;
  double marginright = 0;
  double _hight = 200;
  double _width = 400;
  Color _color = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: AnimatedContainer(
          color: _color,
          margin: EdgeInsets.only(
              top: marginup,
              bottom: margindown,
              left: marginleft,
              right: marginright),
          height: _hight,
          width: _width,
          duration: Duration(seconds: 1),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      marginup = 0;
                      margindown = 0;
                      marginleft = 80;
                      marginright = 0;

                      _color = Colors.yellow;
                    });
                  },
                  child: Text('UP')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          marginup = 0;
                          margindown = 0;
                          marginleft = 0;
                          marginright = 80;
                          _color = Colors.yellow;
                        });
                      },
                      child: Text('Right')),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          marginup = 0;
                          margindown = 0;
                          marginleft = 80;
                          marginright = 0;

                          _color = Colors.yellow;
                        });
                      },
                      child: Text('LEft')),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      marginup = 80;
                      margindown = 0;
                      marginleft = 0;
                      marginright = 0;
                      _color = Colors.yellow;
                    });
                  },
                  child: Text('Down')),
            ],
          ),
        ),
      ),
    );
  }
}
