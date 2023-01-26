import 'package:flutter/material.dart';
import 'package:otpexample/google/Homepage.dart';
import 'package:otpexample/navigation/homepa.dart';
import 'package:otpexample/notification/mainpage.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

enum DrawerSections { dashbord, contact, profile }

var mainController;
var currentPage = DrawerSections.dashbord;

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    setpage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Drawer"),
      ),
      body: mainController,
      drawer: Drawer(
        elevation: 50,
        width: 300,
        backgroundColor: Color.fromARGB(255, 167, 172, 181),
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
              ),
              MyDrawerList()
            ],
          ),
        )),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          menuItem(1, "Deshbord", Icons.dashboard,
              currentPage == DrawerSections.dashbord ? true : false),
          menuItem(2, "contect", Icons.call,
              currentPage == DrawerSections.contact ? true : false),
          Divider(),
          menuItem(3, "profile", Icons.person,
              currentPage == DrawerSections.profile ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.white : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashbord;
            } else if (id == 2) {
              currentPage = DrawerSections.contact;
            } else if (id == 3) {
              currentPage = DrawerSections.profile;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void setpage() {
  if (currentPage == DrawerSections.dashbord) {
    mainController = Drower();
  } else if (currentPage == DrawerSections.contact) {
    mainController = Drower();
  } else if (currentPage == DrawerSections.profile) {
    mainController = Drower();
  }
}
