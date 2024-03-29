import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/TasksShared/Data/tasksFirestore.dart';
import 'package:todo/TasksShared/Domain/sharedTasksModel2.dart';
import 'package:todo/globals.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Tasks/Data/providers.dart';
import '../Data/sharedTasksData.dart';
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Domain/TasksModel2.dart';
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
  String uid=' ';

  @override
  void initState() {
WidgetsFlutterBinding.ensureInitialized();
//     FirebaseAuth.instance
//   .idTokenChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//       // GoRouter.of(context).go('/login');
//       context.go('/login');
//     } else {
//       // setState(() {
//         uid= user.uid;
//       // });
//       print('User is signed in!');
//     }
//   });

if(currUser==null)
  context.go('/login');
else
  uid= currUser!.uid!;
    // currUser==null? context.go('/login'): uid= currUser!.uid!;

  }

  // @override
  // void didChangeDependencies() {
  //   currUser==null? context.go('/login'): uid= currUser!.uid!;
  // }

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

            leading: IconButton(
              icon: Iconn(
                icN: Icons.arrow_back_ios_new,
              ),
              onPressed: () => context.goNamed(
                "home",
                params: {"selectedIndex": "2"},
              ),
            ),

          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text("Tasks", style: TextStyle(color: Theme.of(context).colorScheme.primary)),

        ),
        body: 
        StreamBuilder<List<SharedTodo>>(
          stream:  readTasks(uid),
          builder: (context, snapshot) {
          if (snapshot.hasData){

            final List<SharedTodo> tods=snapshot.data!;
             return ReorderableListView(

          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: tods.map((SharedTodo todo) {
            return SharedTod(
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
            onPressed: () => GoRouter.of(context).go('/addsharedtasks'),
            tooltip: 'Add Item',
            child: Icon(Icons.add)),
      ),
    );
  }

  void handleTodoChange(SharedTodo todo) {
    setState(() {
     
      todo.checked == "false" ? todo.checked = "true" : todo.checked = "false";
      editTask( todo,uid);

    });
  }
}
