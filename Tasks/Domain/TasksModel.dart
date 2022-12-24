import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'TasksModel2.dart';
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

        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text("Tasks"),
          actions: [
            // icon:
            Icon(Icons.people,color: Colors.white),

          ],
        ),
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
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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


