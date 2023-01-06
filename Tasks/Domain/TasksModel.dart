import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import '../Data/providers.dart';
import '../Data/tasksRepository.dart';
import 'TasksModel2.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final taskrep = TasksRepository.instance;
  List<Todo> todoss = [];
  // bool ch=false;
  @override
  void initState() {
    // taskrep.in
    taskrep.fetchTodoList().then((value) {
      setState(() {
        todoss = value;
        // todoss.sort()
        // todoss.any((element) => false)
      });
    });
    // if (todoss.length==0){
    //    taskrep.initTodos().then((value){
    //     todoss=value;
    //   });
    // }
  } // final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    // todoprovider.;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text("Tasks"),
          actions: [
            // icon:
            // Icon(Icons.people,color: Colors.white),
            IconButton(
                onPressed: () {
                  context.go('/sharedtasks');
                },
                icon: Icon(Icons.people, color: Colors.white)),
          ],
        ),
        body: ReorderableListView(
          // key: ,

          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: todoss.map((Todo todo) {
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
              final widget = todoss.removeAt(oldIndex);
              todoss.insert(newIndex, widget);
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
      // if(todo.checked=="false"){
      //   ch=false;
      //
      // }
      todo.checked == "false" ? todo.checked = "true" : todo.checked = "false";
      // todo.checked = !todo.checked;
      taskrep.update(todo);
    });
  }
}
