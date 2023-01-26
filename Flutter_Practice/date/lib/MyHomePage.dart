import 'package:flutter/material.dart';

/**
 * firstname: earliest date 
 * lastdate; maximum possibke date that user 
 * inittial date : which is display picker

 */

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime date_value = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _selected(context);
                    },
                    child: Text("click")),
                Text(
                    "${date_value.day}/${date_value.month}/${date_value.year}"),
              ],
            ),
          ),
        ));
  }

  _selected(BuildContext context) async {
    DateTime? _selected = await showDatePicker(
        context: context,
        initialDate: date_value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        confirmText: "ok",
        cancelText: "cancel",
        initialDatePickerMode: DatePickerMode.year);
    if (_selected != null && _selected != date_value) {
      setState(() {
        date_value = _selected;
      });
    }
  }
}
