import 'package:flutter/material.dart';
import 'package:fluttertask/newtodolist/todo.dart';

import 'colors.dart';

class todoitem extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteitem;
  todoitem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteitem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
          print("Click on todo item");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdblue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdblack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdred,
          ),
          child: IconButton(
              onPressed: () {
                onDeleteitem(todo.id);
                print("Click on deleted ");
              },
              iconSize: 18,
              color: Colors.white,
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
