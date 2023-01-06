import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Data/tasksFirestore.dart';
import 'package:todo/Tasks/Domain/sharedTasksModel2.dart';
import '../Data/providers.dart';
import '../Data/sharedTasksData.dart';
import '../Data/tasksRepository.dart';
import 'TasksModel2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:collection';

class SharedTodoList extends StatefulWidget {
  @override
  SharedTodoListState createState() => SharedTodoListState();
}

class SharedTodoListState extends State<SharedTodoList> {
  DatabaseReference tf = FirebaseDatabase.instance.ref();
  final taskrep = TasksRepository.instance;
Future<List<Todo>> usersf = getUsersOrderByPriority();
  List<Todo> todoss = [];
  // bool ch=false;
  @override
  void initState() {
    
    // createTaskobj(SharedTodo.addstringonly(name: "sad",des: "sad"));
    // createTaskobj(SharedTodo.addstringonly(name: "fg",des: "sadfgd"));
    // createTaskobj(SharedTodo.addstringonly(name: "ef",des: "fdg"));
    createTaskobj(SharedTodo.addstringonly(name: "wer",des: "th"));
    


  } // final List<Todo> _todos = <Todo>[];

  updatetodos() async {
    for (int i = 0; i < todoss.length; i++) {
      tf.child('tasks').push().update(todoss[i].toMap());
    }
  }


  static Future<List<Todo>> getUsersOrderByPriority() async {
    DatabaseReference tf = FirebaseDatabase.instance.ref();
     List<Todo> orderedResult = [];

 final Query query = tf.child('tasks');
// Todo t;
query.get().then((event) {
  Iterator<DataSnapshot> it=event.children.iterator;
  while (it.moveNext()==true){
     orderedResult.add(Todo.fromJson(jsonEncode(it.current.value)));
     it.moveNext();
  };
// for (int i=0;i<event.children.length;i++){
//   // print(jsonEncode(event.value));
//   // event.children.iterator.current.value;
//   orderedResult.add(Todo.fromJson(jsonEncode(event.children.iterator.current.value)));
//   event.children.iterator.moveNext();
// //  orderedResult=fromListjson(jsonEncode(event.value));
// }
  
// return orderedResult;
});

//     query.onChildAdded.forEach((event) {
//     orderedResult.add(Todo.fromJson(jsonEncode(event.snapshot.value)));
//       print(orderedResult);
// //       // return orderedResult;
      
//     });
    //  }
//       print(orderedResult);
// return orderedResult;
 return await query.get()
        .then((ignored) => orderedResult);
// return [];
    
  }




  @override
  Widget build(BuildContext context) {
    // updatetodos();
    // print(getUsersOrderByPriority());
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
                  context.goNamed(
                    "home",
                    params: {"selectedIndex": "2"},
                  );
                },
                icon: Icon(Icons.keyboard_backspace_rounded,
                    color: Colors.white)),
          ],
        ),
        body: 
        StreamBuilder<List<SharedTodo>>(
          stream: readTasks(),
          builder: (context, snapshot) {
          if (snapshot.hasData){
            final List<SharedTodo> tods=snapshot.data!;
             return ReorderableListView(

          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: tods.map((SharedTodo todo) {
            return SharedTodoItem(
              todo: todo,
              onTodoChanged: handleTodoChange,
            );
          }).toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final widget = tods.removeAt(oldIndex);
              tods.insert(newIndex, widget);
            });
          },
          // children: TodoItem,
        );
          }
          else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          else{
            return Text("no data");
          }
        },),
        
        
        
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
      // tf.child('tasks').push().update(todo.toMap());
      // taskrep.update(todo);
    });
  }
}
