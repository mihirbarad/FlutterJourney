import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertask/Service/service.dart';
import 'package:fluttertask/model/taskmodel.dart';
import 'package:fluttertask/screen/todoLIst.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class showlist extends StatefulWidget {
  const showlist({super.key});

  @override
  State<showlist> createState() => _showlistState();
}

class _showlistState extends State<showlist> {
  List<taskmodel> tasklist = <taskmodel>[];
  var result;
  var times;
  bool? isShow = true;
  var isshwos;

  var _myservices = Myservices();

  @override
  void initState() {
    super.initState();
    GethistryBudget();
    String tdata = DateFormat("HH:mm").format(DateTime.now());
    print(tdata);

    print("--------------$tdata----------------");

    if (tdata == times) {
      setState(() {
        isShow = false;
      });
    } else {
      setState(() {
        isShow = true;
      });
    }
  }

  GethistryBudget() async {
    result = await _myservices.getTask();
    tasklist = <taskmodel>[];

    print("------$result\n\n\n");

    result.forEach((Entry) {
      setState(() {
        var taskPerameter = taskmodel();
        taskPerameter.id = Entry['id'];
        taskPerameter.title = Entry['title'];
        taskPerameter.description = Entry['description'];
        taskPerameter.date = Entry['date'];
        taskPerameter.time = Entry['time'];
        times = taskPerameter.time = Entry['time'];

        tasklist.add(taskPerameter);

        print("----addmoney-------$Entry-------------");
      });
    });
  }

  DeleteData(BuildContext context, id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Are you want delete"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        var _result = await _myservices.deleteTaskservice(id);
                        GethistryBudget();
                        Navigator.pop(context);
                      },
                      child: Text("Yes")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No")),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Task Managment",
          style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        Expanded(
            child: Visibility(
          visible: isShow == isshwos ? false : true,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tasklist.length,
            itemBuilder: (context, index) {
              isshwos = tasklist[index].time;
              if (tasklist.length == 0) {
                return Center(
                  child: Text(
                    "Not a Data Found",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                );
              } else {
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                    elevation: 10,
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        '${tasklist[index].title}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '${tasklist[index].description}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      trailing: SizedBox(
                        width: 45.w,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${tasklist[index].date}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${tasklist[index].time}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    DeleteData(context, tasklist[index].id);
                                  },
                                  icon: Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit)),
                            ],
                          ),
                        ),
                      ),
                    ));
              }
            },
          ),
        ))
      ],
    ));
  }
}
