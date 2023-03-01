import 'package:divine_task/Screen/SportsDetils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SportList extends StatefulWidget {
  const SportList({super.key});

  @override
  State<SportList> createState() => _SportListState();
}

class _SportListState extends State<SportList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/abcde.jpg'),
                    radius: 20,
                    //Text
                  ),
                  Column(
                    children: [
                      Text(
                        'Sports Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 80, 80, 80)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SportInformation(),
                            ));
                      },
                      child: Icon(Icons.keyboard_arrow_right_sharp))
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 82.w,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 243, 124, 98)),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFfff6f3),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/abcde.jpg'),
                          radius: 10,
                          //Text
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/abcde.jpg'),
                          radius: 10,
                          //Text
                        ),
                      ), //CircleAvatar
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Team Name vs Team Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Participant',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 177, 175, 173)),
                                ),
                                Text(
                                  ' 2 - ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                Text(
                                  'Participant ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 177, 175, 173)),
                                ),
                                Text(
                                  '   7 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w),
                  child: Container(
                    height: 60,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [Color(0xFFf4a58a), Color(0xFFed7053)],
                        end: Alignment.bottomLeft,
                        begin: Alignment.topRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}
