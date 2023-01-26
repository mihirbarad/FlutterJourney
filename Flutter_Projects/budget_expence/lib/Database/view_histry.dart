import 'package:flutter/material.dart';
import 'package:topsBudget/Database/Service/myService.dart';
import 'package:topsBudget/Database/histryModel.dart';

class View_Fecth extends StatefulWidget {
  const View_Fecth({super.key});

  @override
  State<View_Fecth> createState() => _View_FecthState();
}

class _View_FecthState extends State<View_Fecth> {
  int? names = 0;
  var _monthController = TextEditingController();
  var _mysevice = Myservices();
  List<HistoryModel> _historyget = <HistoryModel>[];
  var mybudget_month = 0;

  _fetchBudgetBymonth(monthname) async {
    var result = await _mysevice.fetchdatabudgetService(monthname);
    _historyget = <HistoryModel>[];
    print("_--------------$result");

    result.forEach((Entry) {
      setState(() {
        var _hiryFetch = HistoryModel();
        _hiryFetch.id = Entry['id'];
        _hiryFetch.current_date = Entry['current_date'];
        _hiryFetch.title = Entry['title'];
        _hiryFetch.type = Entry['type'];
        _hiryFetch.amount = Entry['amount'];

        _historyget.add(_hiryFetch);
        // mybudget_month += _mybudget.amount!;
        // print("------$_budgetList---");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abcd"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                DateTime dateToday = new DateTime.now();
                String curr_date = dateToday.toString().substring(0, 10);

                _fetchBudgetBymonth(curr_date);
              },
              child: Text("Check")),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: _historyget.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Text("${_historyget[index].id}"),
                    Text("${_historyget[index].title}"),
                    Text("${_historyget[index].amount}"),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
