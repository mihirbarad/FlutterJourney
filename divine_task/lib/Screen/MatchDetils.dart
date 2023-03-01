import 'package:divine_task/Screen/SportList.dart';
import 'package:divine_task/Screen/matcheslist.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MatchDetils extends StatefulWidget {
  const MatchDetils({super.key});

  @override
  State<MatchDetils> createState() => _MatchDetilsState();
}

class _MatchDetilsState extends State<MatchDetils> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFf4a58a), Color(0xFFed7053)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Match Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Location",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50, // Image radius
                    backgroundImage: AssetImage('assets/abcde.jpg'),
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 45),
                  ),
                  Text(
                    "-",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 55),
                  ),
                  Text(
                    "3",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFed7053),
                        fontSize: 45),
                  ),
                  CircleAvatar(
                    radius: 50, // Image radius
                    backgroundImage: AssetImage('assets/abcde.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Team Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "score",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFed7053),
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Team Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "List of Participants",
                        style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text("${index + 1} Name"));
                            },
                          ),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "List of Participants",
                        style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text("${index + 1} Name"));
                            },
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Assist",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15, // Image radius
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  Text(
                    "Assistant Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                    radius: 15, // Image radius
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  Text(
                    "Assistant Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Referee",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15, // Image radius
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  Text(
                    "Assistant Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Day& Date",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    "Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 25,
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 243, 124, 98)),
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFfff6f3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Fri.24thFeb,2023'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, bottom: 5.h),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [Color(0xFFf4a58a), Color(0xFFed7053)],
                              end: Alignment.bottomLeft,
                              begin: Alignment.topRight,
                            ),
                          ),
                          child: Icon(
                            Icons.date_range,
                            color: Color.fromARGB(255, 70, 69, 69),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                          height: 25,
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 243, 124, 98)),
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFfff6f3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('2:00 PM to 5:00PM'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, bottom: 5.h),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [Color(0xFFf4a58a), Color(0xFFed7053)],
                              end: Alignment.bottomLeft,
                              begin: Alignment.topRight,
                            ),
                          ),
                          child: Icon(
                            Icons.watch_later_outlined,
                            color: Color.fromARGB(255, 70, 69, 69),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: Text("Other Match",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              MatchList(),
            ],
          ),
        ),
      ),
    );
  }
}
