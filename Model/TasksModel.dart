import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Data/TasksData.dart';
import 'dart:math';

import 'package:todo/Model/AddTask.dart';
import 'package:todo/Model/taskDescription.dart';
import 'package:todo/pages/home_page.dart';

import 'EditTask.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) {
      return const TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.lineThrough,
      );
    }

    return const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 3,
      decorationColor: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Dismissible(
        key: ObjectKey(todo),
        onDismissed: (direction) {
          todos.remove(todo);
        },
        background: Container(color: Colors.red),
        child: Card(
          elevation: 0,
          // color: Color.fromRGBO(10, 145, 171, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).primaryColor,
          // color: Colors.amber,

          child: ListTile(
            onLongPress: () {
              // GoRouter.of(context).go('/addtask');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditTask(todo: todo),
                ),
              );
            },
            //
            onTap: () {
              onTodoChanged(todo);
            },
            leading: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.note_alt_outlined),
            // Text()

            // leading: CircleAvatar(
            //   child: Text(todo.name[0]),
            // ),

            title: Text(todo.name, style: _getTextStyle(todo.checked)),
            // value: todo.checked,
            // onChanged: (bool? value) {
            //   onTodoChanged(todo);
            // },
            //
            //  checkboxShape: ContinuousRectangleBorder(),
          ),
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    todos;
  } // final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    // inittodos();
    return SafeArea(
      child: Scaffold(
        body:
            // ListView.builder(
            //   itemCount: todos.length,
            //     itemBuilder: (context, index) {
            //    final item=  todos[index],
            //    todos.map((Todo todo) {
            //             return TodoItem(
            //               todo: todo,
            //               onTodoChanged: handleTodoChange,
            //             );
            //     },
            //      Dismissible(key: ObjectKey(item),
            //          child: child
            //      )
            //
            // )
            ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: todos.map((Todo todo) {
            return TodoItem(
              todo: todo,
              onTodoChanged: handleTodoChange,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            onPressed: () => GoRouter.of(context).go('/addtask'),
            tooltip: 'Add Item',
            child: Icon(Icons.add)),
      ),
    );
  }

  // void inittodos(){
  //   addTodoItem("sdfsd");
  // }
  void handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  // void addTodoItem({required String name, required category cat, required String rem,required String des}) {
  //   Random random =  Random();
  //   int randomNumber = random.nextInt(101);
  //   setState(() {
  //
  //     todos.add(Todo(name: name, checked: false,cat: cat,reminder: rem,percentage: randomNumber.toDouble(),description: des));
  //   });
  //   _textFieldController.clear();
  // }

}
