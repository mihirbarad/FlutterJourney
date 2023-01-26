import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/histryModel.dart';
import 'package:topsBudget/Database/incomeModel.dart';
import 'package:topsBudget/Homepage.dart';
import 'package:topsBudget/main.dart';

class income extends StatefulWidget {
  const income({super.key});

  @override
  State<income> createState() => _incomeState();
}

class _incomeState extends State<income> {
  final List<String> items = [
    'Cash',
    'Paytm',
    'GPay',
    'Net Banking',
  ];
  String? selectedValue;
  var MEthordController = TextEditingController();
  var titleController = TextEditingController();
  var IncomeController = TextEditingController();
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
  bool amountValidator = false;
  bool dateValidator = false;
  bool timeValidator = false;
  bool modeValidator = false;

  var _servies = Myservices();
  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "₹${IncomeController.text.toString()} ",
        "Money added on your income",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

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
              "Income Details",
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
                    controller: IncomeController,
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

            // Container(
            //   width: 85.w,
            //   child: TextFormField(
            //     controller: MEthordController,
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: Color.fromARGB(255, 14, 69, 83),
            //       fontWeight: FontWeight.w500,
            //     ),
            //     decoration: InputDecoration(
            //       errorText: modeValidator ? "field error " : null,
            //       focusColor: Colors.white,
            //       //add prefix icon
            //       prefixIcon: Icon(
            //         Icons.wallet,
            //         color: Color.fromARGB(248, 141, 115, 29),
            //       ),

            //       labelText: 'Mode',
            //       hintText: 'eg: Cash,Pytm',
            //       labelStyle: TextStyle(
            //         fontSize: 16,
            //         color: Color.fromARGB(248, 141, 115, 29),
            //         fontWeight: FontWeight.w600,
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),

            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //             color: Color.fromARGB(248, 255, 219, 99), width: 1.0),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       fillColor: Color.fromARGB(255, 123, 246, 255),
            //     ),
            //   ),
            // ),
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
                    print('---->>>>>>>>>>>>${titleController.text.toString()}');
                    print(
                        '---->>>>>>>>>>>>${IncomeController.text.toString()}');
                    print('---->>>>>>>>>>>>${_dateC.text.toString()}');
                    print('---->>>>>>>>>>>>${_timeC.text.toString()}');
                    print(
                        '---->>>>>>>>>>>>${MEthordController.text.toString()}');
                    setState(() {
                      //for validation we fecth details from conntroller and check is it empty or not
                      titleController.text.isEmpty
                          ? timeValidator = true
                          : timeValidator = false;
                      IncomeController.text.isEmpty
                          ? amountValidator = true
                          : amountValidator = false;
                      _dateC.text.isEmpty
                          ? dateValidator = true
                          : dateValidator = false;
                      _timeC.text.isEmpty
                          ? timeValidator = true
                          : timeValidator = false;
                      // MEthordController.text.isEmpty
                      //     ? modeValidator = true
                      //     : modeValidator = false;
                    });

                    if (titleValidator == false &&
                        amountValidator == false &&
                        dateValidator == false &&
                        timeValidator == false) {
                      var _myincome = incomeModel();
                      var _allhistory = HistoryModel();
                      _myincome.amount =
                          int.parse(IncomeController.text.toString());
                      _myincome.date = _dateC.text.toString();
                      _myincome.time = _timeC.text.toString();
                      _myincome.title = titleController.text.toString();
                      _myincome.methord = selectedValue;
                      _myincome.bool = check;
                      print("==============${selectedValue}======>>>");
                      print(MEthordController.text.toString());
                      var result =
                          await _servies.insertBudgetService(_myincome);
                      print('--->>>>${result}<<<<--------');
                      DateTime dateToday = new DateTime.now();
                      String curr_date = dateToday.toString().substring(0, 10);
                      print("=====>>>>${curr_date}===<<<<<<<=====");

                      _allhistory.amount =
                          int.parse(IncomeController.text.toString());
                      _allhistory.date = _dateC.text.toString();

                      _allhistory.title = titleController.text.toString();
                      _allhistory.type = 'Income';
                      _allhistory.icons = 'green';
                      _allhistory.current_date = curr_date.toString();
                      var resultHistoryIncome =
                          await _servies.inserhistory(_allhistory);
                      Fluttertoast.showToast(
                          msg: "Save Succesfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 8, 8, 78),
                          textColor: Colors.white,
                          fontSize: 16.0);
                      showNotification();

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
                      titleController.text = '';
                      IncomeController.clear();
                      _dateC.clear();
                      _timeC.clear();
                      MEthordController.clear();
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
