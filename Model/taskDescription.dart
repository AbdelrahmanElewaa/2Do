import 'package:flutter/material.dart';
import 'package:todo/Data/TasksData.dart';


class tasktodo extends StatelessWidget {
  final Todo todo;
  // final onTodoChanged;
  tasktodo({
    required this.todo,
    // required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sdf"),
      ),
      body: Center(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.red,
          child: SizedBox(
            width: 300,
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Text
                 ListTile(
                  // leading: Icon(Icons.album, size: 60),
                  title: Text(
                      "Name:" + todo.name,
                      style: TextStyle(fontSize: 20.0)
                  ),
                ),
              ],
            ),

          ),

        ),
      ),
    );
    // TODO: implement build
    // throw UnimplementedError();
  }

}