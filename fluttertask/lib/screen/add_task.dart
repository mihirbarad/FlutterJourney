import 'package:flutter/material.dart';
import 'package:fluttertask/Service/service.dart';
import 'package:fluttertask/model/taskmodel.dart';
import 'package:fluttertask/screen/todoLIst.dart';

import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var _dateC = TextEditingController();
  var _timeC = TextEditingController();
  var check = 'true';

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  ///Time
  TimeOfDay timeOfDay = TimeOfDay.now();

  bool titleValidator = false;
  bool descriptionValidator = false;
  bool dateValidator = false;
  bool timeValidator = false;

  var _servies = Myservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Task Details",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 85.w,
                child: TextFormField(
                  controller: titleController,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 14, 69, 83),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    errorText: titleValidator ? "field error " : null,
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: Icon(Icons.menu, color: Colors.blueGrey),

                    labelText: 'Enter Title',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color.fromARGB(255, 123, 246, 255),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 48.w),
                child: Text(
                  " Enter Description",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
              ),
              Container(
                width: 85.w,
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: 8,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 14, 69, 83),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    errorText: descriptionValidator ? "field error " : null,
                    focusColor: Colors.white,
                    //add prefix icon

                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color.fromARGB(255, 123, 246, 255),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40.w,
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      onTap: () => displayDatePicker(context),
                      controller: _dateC,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 14, 69, 83),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        errorText: dateValidator ? "field error " : null,
                        focusColor: Colors.white,
                        //add prefix icon
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Color.fromARGB(248, 141, 115, 29),
                        ),

                        labelText: 'Date',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(248, 141, 115, 29),
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(248, 255, 219, 99),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Color.fromARGB(255, 123, 246, 255),
                      ),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      onTap: () => displayTimePicker(context),
                      controller: _timeC,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 14, 69, 83),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        errorText: timeValidator ? "field error " : null,
                        focusColor: Colors.white,
                        //add prefix icon
                        prefixIcon: Icon(
                          Icons.timer,
                          color: Color.fromARGB(248, 141, 115, 29),
                        ),

                        labelText: 'Time',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(248, 141, 115, 29),
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(248, 255, 219, 99),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Color.fromARGB(255, 123, 246, 255),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(25.w, 5.h),
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () async {
                      print(titleController.text);
                      print(descriptionController.text);
                      print(_dateC.text);
                      print(_timeC.text);
                      setState(() {
                        //for validation we fecth details from conntroller and check is it empty or not
                        titleController.text.isEmpty
                            ? titleValidator = true
                            : titleValidator = false;
                        descriptionController.text.isEmpty
                            ? descriptionValidator = true
                            : descriptionValidator = false;
                        _timeC.text.isEmpty
                            ? timeValidator = true
                            : timeValidator = false;
                        _dateC.text.isEmpty
                            ? dateValidator = true
                            : dateValidator = false;
                      });

                      if (titleValidator == false &&
                          descriptionValidator == false &&
                          timeValidator == false &&
                          dateValidator == false) {
                        var Tasks = taskmodel();

                        Tasks.description =
                            descriptionController.text.toString();
                        Tasks.title = titleController.text.toString();
                        Tasks.date = _dateC.text.toString();
                        Tasks.time = _timeC.text.toString();

                        print("====================>>>");

                        var result = await _servies.inserTasks(Tasks);
                        print('--->>>>${result}<<<<--------');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => todoLIst(),
                            ));
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text('Clear'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(25.w, 5.h),
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () {
                      setState(() {
                        titleController.text = '';
                        descriptionController.clear();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      setState(() {
        _dateC.text = date.toLocal().toString().split(" ")[0];
      });
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      setState(() {
        _timeC.text = "${time.hour}:${time.minute}";
      });
    }
  }
}
