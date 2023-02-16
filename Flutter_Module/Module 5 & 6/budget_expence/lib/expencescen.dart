import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/expenceModel.dart';
import 'package:topsBudget/Database/histryModel.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/main.dart';

class expenceScreen extends StatefulWidget {
  const expenceScreen({super.key});

  @override
  State<expenceScreen> createState() => _incomeState();
}

class _incomeState extends State<expenceScreen> {
  var _MEthordController = TextEditingController();
  var _titleController = TextEditingController();
  var _IncomeController = TextEditingController();
  var _dateController = TextEditingController();
  var _timeController = TextEditingController();
  var _check = 'false';
  var icn = 'red';
  var type = 'expence';

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  ///Time
  TimeOfDay timeOfDay = TimeOfDay.now();

  bool titleValidator = false;
  bool amountValidator = false;
  bool dateValidator = false;
  bool timeValidator = false;
  bool modeValidator = false;

  var _expenceService = Myservices();
  final List<String> items = [
    'Cash',
    'Paytm',
    'GPay',
    'Net Banking',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Text(
              "Expence Details",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(248, 155, 134, 64),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: 85.w,
              child: TextFormField(
                controller: _titleController,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 14, 69, 83),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  errorText: titleValidator ? "field error " : null,
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: Icon(
                    Icons.menu,
                    color: Color.fromARGB(248, 141, 115, 29),
                  ),

                  labelText: 'Enter Title',
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
                        color: Color.fromARGB(248, 255, 219, 99), width: 1.0),
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
                    keyboardType: TextInputType.number,
                    controller: _IncomeController,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 14, 69, 83),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      errorText: amountValidator ? "field error " : null,
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: Icon(
                        Icons.currency_rupee_outlined,
                        color: Color.fromARGB(248, 141, 115, 29),
                      ),

                      labelText: 'Amount',
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
                    onTap: () => displayDatePicker(context),
                    controller: _dateController,
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
              ],
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
                    onTap: () => displayTimePicker(context),
                    controller: _timeController,
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    focusColor: Colors.amber,
                    hint: Text(
                      'Select Mode',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 19, 19, 19),
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    iconSize: 14,
                    iconEnabledColor: Colors.yellow,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 55,
                    buttonWidth: 160,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Color.fromARGB(66, 93, 92, 92),
                        ),
                        color: Color.fromARGB(255, 244, 242, 238)),
                    itemHeight: 38,
                    buttonElevation: 2,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 200,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 208, 198, 167),
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(25.w, 5.h),
                    primary: Color.fromARGB(248, 155, 134, 64),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () async {
                    print(
                        '---->>>>>>>>>>>>${_titleController.text.toString()}');
                    print(
                        '---->>>>>>>>>>>>${_IncomeController.text.toString()}');
                    print('---->>>>>>>>>>>>${_dateController.text.toString()}');
                    print('---->>>>>>>>>>>>${_timeController.text.toString()}');
                    print(
                        '---->>>>>>>>>>>>${_MEthordController.text.toString()}');
                    setState(() {
                      _titleController.text.isEmpty
                          ? timeValidator = true
                          : timeValidator = false;
                      _IncomeController.text.isEmpty
                          ? amountValidator = true
                          : amountValidator = false;
                      _dateController.text.isEmpty
                          ? dateValidator = true
                          : dateValidator = false;
                      _timeController.text.isEmpty
                          ? timeValidator = true
                          : timeValidator = false;
                    });

                    if (titleValidator == false &&
                        amountValidator == false &&
                        dateValidator == false &&
                        timeValidator == false) {
                      var _myexpence = ExpenceModel();
                      var _myHistrory = HistoryModel();
                      DateTime dateToday = new DateTime.now();
                      String curr_date = dateToday.toString().substring(0, 10);

                      _myexpence.amount =
                          int.parse(_IncomeController.text.toString());
                      _myexpence.date = _dateController.text.toString();
                      _myexpence.time = _timeController.text.toString();
                      _myexpence.title = _titleController.text.toString();
                      _myexpence.methord = selectedValue;
                      _myexpence.bool = _check;

                      _myHistrory.amount =
                          int.parse(_IncomeController.text.toString());
                      _myHistrory.date = _dateController.text.toString();
                      _myHistrory.title = _titleController.text.toString();
                      _myHistrory.icons = "red";
                      _myHistrory.type = "Expense";
                      _myHistrory.current_date = curr_date;

                      print("---> EXPENSE : title  ${_myHistrory.title}");

                      var historyResult =
                          await _expenceService.inserhistory(_myHistrory);

                      print("----> date : ${_myHistrory.date}");
                      print("-----> ${_myHistrory.icons}");
                      print("++++> HISTORY RESUULT : $historyResult");

                      print(_MEthordController.text.toString());

                      var result =
                          await _expenceService.inserExpence(_myexpence);

                      flutterLocalNotificationsPlugin.show(
                          0,
                          "₹${_IncomeController.text.toString()} ",
                          "Money added on your Expense",
                          NotificationDetails(
                              android: AndroidNotificationDetails(
                                  channel.id, channel.name,
                                  channelDescription: channel.description,
                                  importance: Importance.high,
                                  color: Colors.blue,
                                  largeIcon:
                                      const DrawableResourceAndroidBitmap(
                                          '@mipmap/ic_launcher'),
                                  playSound: true,
                                  icon: '@mipmap/ic_launcher')));

                      Fluttertoast.showToast(
                          msg: "Save Succesfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 8, 8, 78),
                          textColor: Colors.white,
                          fontSize: 16.0);

                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 1000),
                            child: Homepage(person_Name: ''),
                            inheritTheme: true,
                            ctx: context),
                      );
                    }
                  },
                ),
                ElevatedButton(
                  child: Text('Clear'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(25.w, 5.h),
                    primary: Color.fromARGB(248, 155, 134, 64),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    setState(() {
                      _titleController.text = '';
                      _IncomeController.clear();
                      _dateController.clear();
                      _timeController.clear();
                      _MEthordController.clear();
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
        _dateController.text = date.toLocal().toString().split(" ")[0];
      });
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      setState(() {
        _timeController.text = "${time.hour}:${time.minute}";
      });
    }
  }
}
