import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/expenceModel.dart';
import 'package:topsBudget/Database/histryModel.dart';
import 'package:topsBudget/Database/incomeModel.dart';
import 'package:topsBudget/Database/viewAllHistry.dart';
import 'package:topsBudget/Database/view_histry.dart';
import 'package:topsBudget/add_item.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:topsBudget/googleSinin/auth_service.dart';
import 'package:topsBudget/main.dart';
import 'package:topsBudget/stetic.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  var person_Name;
  Homepage({super.key, required this.person_Name});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          barrierColor: Color.fromARGB(159, 0, 0, 0),
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you exit App  '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  var income = 0;
  var expenceMoney = 0;
  double percentage = 0;
  var date;

  ///Time

  List<incomeModel> HistrybudgetList = <incomeModel>[];
  List<ExpenceModel> ExpenceHistoryList = <ExpenceModel>[];
  List<HistoryModel> HistryModel = <HistoryModel>[];

  var _myservices = Myservices();

  var incos;

  var addmoney = 0;
  var curentDate;
  int? names = 0;
  var dateController = TextEditingController();
  var _mysevice = Myservices();

  @override
  void initState() {
    super.initState();
    GethistryBudget();
    GetHistory();
    HistoryGetExpence();

    // init fetch data function when open page
    fetchData();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  fetchData() {
    DateTime dateToday = new DateTime.now();
    String curr_date = dateToday.toString().substring(0, 10);

    _fetchBudgetBymonth(curr_date);
  }

  HistoryGetExpence() async {
    var result = await _myservices.historyGetExpence();
    ExpenceHistoryList = <ExpenceModel>[];

    print("------$result\n\n\n");

    result.forEach((Entry) {
      setState(() {
        var _myexpence = ExpenceModel();
        _myexpence.id = Entry['id'];

        _myexpence.amount = Entry['amount'];

        ExpenceHistoryList.add(_myexpence);
        expenceMoney += _myexpence.amount!;
      });
    });
  }

  GethistryBudget() async {
    var result = await _myservices.historyGetAllBudget();
    HistrybudgetList = <incomeModel>[];

    print("------$result\n\n\n");

    result.forEach((Entry) {
      setState(() {
        var _mybudget = incomeModel();
        _mybudget.id = Entry['id'];
        _mybudget.title = Entry['title'];
        _mybudget.amount = Entry['amount'];
        _mybudget.date = Entry['Date'];
        _mybudget.time = Entry['time'];
        _mybudget.methord = Entry['methord'];
        _mybudget.bool = Entry['bool'];

        HistrybudgetList.add(_mybudget);
        income += _mybudget.amount!;

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
                        var _result =
                            await _myservices.deleteDataBudgetService(id);
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

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "money add $addmoney ",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  List<HistoryModel> HistryList = <HistoryModel>[];
  List<HistoryModel> fetchhfect = <HistoryModel>[];

  GetHistory() async {
    var result = await _myservices.historyGetHistory();
    HistryList = <HistoryModel>[];

    print("------$result\n\n\n");

    result.forEach((Entry) {
      setState(() {
        var _myHistory = HistoryModel();
        _myHistory.id = Entry['id'];
        _myHistory.title = Entry['title'];
        _myHistory.amount = Entry['amount'];
        _myHistory.date = Entry['Date'];
        _myHistory.type = Entry['type'];
        _myHistory.icons = Entry['icons'];

        HistryList.add(_myHistory);

        print("----addmoney-------$Entry-------------");
      });
    });
  }

  _fetchBudgetBymonth(monthname) async {
    var result = await _mysevice.fetchdatabudgetService(monthname);
    fetchhfect = <HistoryModel>[];
    print("_--------------$result");

    result.forEach((Entry) {
      setState(() {
        var _hiryFetch = HistoryModel();
        _hiryFetch.id = Entry['id'];
        _hiryFetch.current_date = Entry['current_date'];
        _hiryFetch.title = Entry['title'];
        _hiryFetch.type = Entry['type'];
        _hiryFetch.amount = Entry['amount'];

        fetchhfect.add(_hiryFetch);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:
            // CustomRefreshIndicator(

            //     /// delegate with configuration
            //     builder: MaterialIndicatorDelegate(
            //       builder: (context, controller) {
            //         return Icon(
            //           Icons.ac_unit,
            //           color: Colors.blue,
            //           size: 30,
            //         );
            //       },
            //     ),
            //     onRefresh: _fetchBudgetBymonth(curentDate),
            //     child:
            Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Color.fromARGB(248, 105, 86, 23),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 1000),
                          child: Add_incomeandExpence(),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                ),
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      SizedBox(
                        height: 5.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    AuthService().signOut();
                                  },
                                  child: Icon(
                                    Icons.person,
                                    size: 5.h,
                                    color: Color.fromARGB(255, 4, 49, 86),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 1000),
                                        child: stetic(
                                            expenceMoney: expenceMoney,
                                            income: income,
                                            percentage: percentage),
                                        inheritTheme: true,
                                        ctx: context),
                                  );
                                },
                                icon: Icon(
                                  Icons.stacked_bar_chart,
                                  size: 5.h,
                                  color: Color.fromARGB(255, 4, 49, 86),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          "Your Balance",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹${addmoney = income - expenceMoney}.00",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(247, 178, 180, 180)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Income",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green),
                                ),
                                subtitle: Text(
                                  "₹${income}",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                leading: Icon(
                                  Icons.arrow_circle_up_outlined,
                                  color: Colors.green,
                                  size: 7.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Expence",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                subtitle: Text(
                                  "₹${expenceMoney}",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                leading: Icon(
                                  Icons.arrow_circle_down_outlined,
                                  color: Colors.red,
                                  size: 6.h,
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 4.h,
                      ),
                      Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: fetchhfect.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (fetchhfect[index].type == 'Expense') {
                                incos = Icon(
                                  Icons.arrow_circle_down_outlined,
                                  color: Colors.red,
                                  size: 6.h,
                                );
                              } else {
                                incos = Icon(
                                  Icons.arrow_circle_up_outlined,
                                  color: Colors.green,
                                  size: 6.h,
                                );
                              }
                              return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: 2.h, vertical: 1.h),
                                  elevation: 10,
                                  child: ListTile(
                                    onTap: () {},
                                    leading: incos,
                                    title: Text(
                                      '${fetchhfect[index].title}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      '₹${fetchhfect[index].amount}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    trailing: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${fetchhfect[index].type}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          )),
                      SizedBox(
                        height: 4.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => viwee_history(),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Show All transactions.",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ]))));
  }
}
