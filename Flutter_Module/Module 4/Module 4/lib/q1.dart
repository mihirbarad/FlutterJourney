import 'package:flutter/material.dart';
/*
firstdate:earlist date
lastdate:maximum possible date that user can select 
initial date: which is display when date picker appear
 */
class MyDate extends StatefulWidget {
  const MyDate({super.key});

  @override
  State<MyDate> createState() => _MyDateState();
}

class _MyDateState extends State<MyDate> {
  DateTime date_value = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("click here")),
            Text("${date_value.day}/${date_value.month}/${date_value.year}",
            style: TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
  _selectedDate(BuildContext context)async{
    DateTime? selectedDate = await showDatePicker(context: context, initialDate: date_value, firstDate: DateTime(2000), lastDate: DateTime(2025),
    helpText: "Select Date",
    confirmText: "ok",
    cancelText: "cancel",
    initialDatePickerMode: DatePickerMode.year
    );
    if(selectedDate != null && selectedDate != date_value){
      setState(() {
        date_value = selectedDate;
      });
    }
  }
}