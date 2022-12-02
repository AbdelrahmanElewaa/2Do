import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Data/TasksData.dart';
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      decorationColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Slidable(
        key: ObjectKey(todo),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: ()
            {
              todos.remove(todo);
              const snackBar = SnackBar(
                content: Text('Item successfully deleted!!'),
                backgroundColor:  Color.fromARGB(255, 71, 181, 255),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            ),
            children:   [
              SlidableAction(
                onPressed: (context) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditTask(todo: todo),
                    ),
                  );
                },
                backgroundColor: Color.fromARGB(255, 71, 181, 255),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) {
                  todos.remove(todo);
                  // Noti
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ],
        ),

        startActionPane:  ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {
      // Navigator.of(context).push(
      // MaterialPageRoute(
      // builder: (context) => EditTask(todo: todo),
      // ),
      // );
      },
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
            ),
            SlidableAction(
              onPressed:  (context) {
          // Navigator.of(context).push(
          // MaterialPageRoute(
          // builder: (context) => EditTask(todo: todo),
          // ),
          // );
      },
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
            ),
          ],
        ),
        // onDismissed: (direction) {
        //   todos.remove(todo);
        // },
        // background: Container(color: Colors.red),
        child: Card(
          elevation: 0,
          // color: Color.fromRGBO(10, 145, 171, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).primaryColor,
          // color: Colors.amber,

          child: ListTile(
            // onLongPress: () {
            //   // GoRouter.of(context).go('/addtask');
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => EditTask(todo: todo),
            //     ),
            //   );
            // },
            onTap: () {
              onTodoChanged(todo);
            },
            leading: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.note_alt_outlined),

            title: Text(todo.name, style: _getTextStyle(todo.checked)),
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
    return SafeArea(
      child: Scaffold(
        body:
        ReorderableListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: todos.map((Todo todo) {
            return TodoItem(
              todo: todo,
              onTodoChanged: handleTodoChange,
            );
          }).toList(),
          onReorder: (int oldIndex, int newIndex) {
      setState(() {
      if (oldIndex < newIndex) {
      newIndex -= 1;
      }
      final  widget = todos.removeAt(oldIndex);
      todos.insert(newIndex, widget);
      });
      },
        // children: TodoItem,
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            onPressed: () => GoRouter.of(context).go('/addtask'),
            tooltip: 'Add Item',
            child: Icon(Icons.add)),
      ),
    );
  }

  void handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void reorderTodos(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = todos.removeAt(oldIndex);
    setState(() {
      todos.insert(newIndex, item);
    });
  }

}
