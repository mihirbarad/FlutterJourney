import 'package:flutter/material.dart';
import 'package:fluttertask/Service/service.dart';
import 'package:fluttertask/model/taskmodel.dart';
import 'package:fluttertask/screen/add_task.dart';
import 'package:fluttertask/screen/todoListview.dart';
import 'package:sizer/sizer.dart';

class todoLIst extends StatefulWidget {
  const todoLIst({super.key});

  @override
  State<todoLIst> createState() => _todoLIstState();
}

class _todoLIstState extends State<todoLIst> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    showlist(),
    showlist(),
    showlist(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => add_task(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending,
                ),
                label: "Pending",
                backgroundColor: Color.fromARGB(255, 182, 212, 227)),
            BottomNavigationBarItem(
                icon: Icon(Icons.subject_rounded),
                label: "Completed",
                backgroundColor: Color.fromARGB(255, 182, 212, 227)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Overdue",
                backgroundColor: Color.fromARGB(255, 182, 212, 227)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
