import 'package:fluttertask/Service/repository.dart';
import 'package:fluttertask/model/taskmodel.dart';

class Myservices {
  late Repository _repository;
  Myservices() {
    _repository = Repository();
  }
  inserTasks(taskmodel _taskmodel) async {
    return await _repository.InsertTask("task", _taskmodel.taskmodels());
  }

  getTask() async {
    return await _repository.selectTask("task");
  }

  deleteTaskservice(taskID) async {
    return await _repository.deleteTask("task", taskID);
  }

  fetchdataHistryService(monthname) async {
    return await _repository.fetchEntrybymonth("history", monthname);
  }
}
