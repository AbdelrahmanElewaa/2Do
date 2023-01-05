import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import '../Data/providers.dart';
import '../Data/tasksRepository.dart';
import 'TasksModel2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class SharedTodoList extends StatefulWidget {
  @override
  SharedTodoListState createState() => SharedTodoListState();


  
}

class SharedTodoListState extends State<SharedTodoList> {
   
   DatabaseReference tf=FirebaseDatabase.instance.ref();
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
    // tf.push();
    
    // tf.update(todoss.);
  } // final List<Todo> _todos = <Todo>[];

update() async{
  for (int i =0;i<todoss.length;i++){
      tf.child('tasks').child(i.toString()).update(todoss[i].toMap());
    }
}

Future<Object?> read() async {
final snapshot = await tf.get() ;
    return snapshot.value;
  }


  Future<List<Todo>> getAllMerchants() async {
  List<Todo> merchantList = [];
  
  await tf.get().then(( DataSnapshot querySnapshot) {
    // querySnapshot.getvalue(Todo.Class);
    querySnapshot.children.forEach((doc) {
      // Todo merchant = Todo.fromMap(
      //   // {
      //     // doc.value;
      //   // 'shopName': doc['shopname'],
      //   // 'address': doc['address'],
      //   // 'description': doc['description'],
      //   // 'thumbnail': doc['thumbnail'],
      //   // 'locationCoords': doc['location'],
      // // }
      // );
      // merchantList.add(merchant);
    });
  });

 return merchantList;
}

  @override
  Widget build(BuildContext context) {
    update();
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
            IconButton(onPressed: () {
              context.goNamed(
          "home",
          params: { "selectedIndex":"2"},
        );
            }, 
            icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white)),

          ],

        ),
        body:

        ReorderableListView(
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
      final  widget = todoss.removeAt(oldIndex);
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
      todo.checked=="false"?todo.checked="true":todo.checked="false";
      // todo.checked = !todo.checked;
      taskrep.update(todo);

    });
  }


}


