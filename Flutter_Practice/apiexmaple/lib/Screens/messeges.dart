import 'dart:async';

import 'package:apiexmaple/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class Messeges extends StatefulWidget {
  const Messeges({super.key});

  @override
  State<Messeges> createState() => _MessegesState();
}

class _MessegesState extends State<Messeges> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  late Future<List<dynamic>> _data;
  bool? isVisible;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
    // flutterLocalNotificationsPlugin.show(
    //                         0,
    //                         "${snapshot.data![index]['title']}",
    //                         "${snapshot.data![index]['subtitle']}",
    //                         NotificationDetails(
    //                             android: AndroidNotificationDetails(
    //                                 channel.id, channel.name,
    //                                 channelDescription: channel.description,
    //                                 importance: Importance.high,
    //                                 color: Colors.blue,
    //                                 playSound: true,
    //                                 icon: '@mipmap/ic_launcher')));
    // Output: true
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    setState(() {
      _data = fetchData();
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[Color(0xFFCA5FDA), Color(0xFFFFCFAA)]),
          ),
        ),
        title: Text(
          "Messeges",
          style: TextStyle(color: Color.fromARGB(255, 61, 31, 20)),
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,

        color: Color.fromARGB(255, 252, 216, 227),
        height: 8.h,
        animSpeedFactor: 5.0,
        springAnimationDurationInMilliseconds: 2000,
        child: FutureBuilder<List<dynamic>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  var shows = snapshot.data![index]['showm'].toString();
                  print(">>>>>>>>$shows<<<<<<<");
                  if (shows == "0") {
                    isVisible = true;
                  } else {
                    isVisible = false;
                  }

                  return Visibility(
                    visible: isVisible!,
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {},
                        leading: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.notifications),
                        ),
                        title: Text(snapshot.data![index]['title']),
                        subtitle: Text(snapshot.data![index]['subtitle']),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          },
        ), // scroll view
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    var response = await http.get(
        Uri.parse('https://digitalsocity.000webhostapp.com/messegeApi.php'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
