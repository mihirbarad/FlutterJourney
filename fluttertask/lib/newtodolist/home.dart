import 'package:flutter/material.dart';
import 'package:fluttertask/newtodolist/colors.dart';
import 'package:fluttertask/newtodolist/todo.dart';
import 'package:fluttertask/screen/todoLIst.dart';

import 'todoItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoLIst = Todo.todoList();
  final _todoController = TextEditingController();
  List<Todo> _foundTodo = [];
  @override
  void initState() {
    _foundTodo = todoLIst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdbgcolor,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "All todos",
                          ),
                        ),
                        for (Todo todo in _foundTodo.reversed)
                          todoitem(
                            todo: todo,
                            onToDoChanged: _handleTodoChange,
                            onDeleteitem: _deleteTodoItem,
                          ),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'add text', border: InputBorder.none),
                  ),
                )),
                Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                        onPressed: () {
                          _addTODOitem(_todoController.text.toString());
                        },
                        child: Text("+")))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoLIst.removeWhere((item) => item.id == id);
    });
  }

  void _addTODOitem(String todo) {
    setState(() {
      todoLIst.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todoController.clear();
  }

  void _runFilter(String enterKeywords) {
    List<Todo> result = [];
    if (enterKeywords.isEmpty) {
      result = todoLIst;
    } else {
      result = todoLIst
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enterKeywords.toLowerCase()))
          .toList();
      setState(() {
        _foundTodo = result;
      });
    }
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdblack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdgey)),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdbgcolor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdblack,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: tdblack,
            size: 30,
          ),
        ],
      ),
    );
  }
}
