import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import '../../globals.dart';
import '../Data/providers.dart';
import '../Data/tasksRepository.dart';
import 'TasksModel2.dart';
import 'TodoNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerStatefulWidget {
  @override
  // ConsumerState<ConsumerStatefulWidget> createState() {
    TodoListState createState() => TodoListState();
  // }
}
//   @override
//   TodoListState createState() => TodoListState();
// }

class TodoListState extends ConsumerState<TodoList> {
  final taskrep = TasksRepository.instance;
  List<Todo> normaltodos = [];
  List<Todo> searchtodos = [];
  bool searchBoolean = false;
  // bool ch=false;
  @override
  void initState() {
    // taskrep.in
    taskrep.fetchTodoList().then((value) {
      setState(() {
        normaltodos = value;
        // todoss.sort()
        // todoss.any((element) => false)
      });

      ref.watch(todosProvider).todos=normaltodos;
    });

  } // final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: !searchBoolean ? Text("Tasks", style: TextStyle(color: Theme.of(context).colorScheme.primary),) : searchTextField(),
          actions:

          !searchBoolean
              ? [
            IconButton(
                icon: Icon(Icons.search,color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  setState(() {
                    searchBoolean = true;
                    searchtodos = [];
                    ref.watch(todosProvider).todos=searchtodos;
                  });
                }),
            IconButton(
                onPressed: () {
                  currUser==null? context.go('/login'): context.go('/sharedtasks');

                },
                icon: Icon(Icons.people, color: Theme.of(context).colorScheme.primary)),
          ]
              : [
            IconButton(
                icon: Icon(Icons.clear,color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  setState(() {
                    searchBoolean = false;
                    taskrep.fetchTodoList().then((value) {
                        normaltodos = value;
                        ref.watch(todosProvider).todos=normaltodos;
                    });
                  });
                }
            ),
            IconButton(
                onPressed: () {
                  currUser==null? context.go('/login'): context.go('/sharedtasks');
                },
                icon: Icon(Icons.people, color: Theme.of(context).colorScheme.primary)),
          ]

        ),
        body: !searchBoolean?defaultlistview() :searchlistview(),// floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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

      // todo.checked == "false" ? todo.checked = "true" : todo.checked = "false";

      taskrep.update(ref.read(todosProvider.notifier).toggle(todo.id!));

    });
  }

  Widget defaultlistview(){

  return  ListView(
      // key: ,

      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: ref.watch(todosProvider).todos.map((Todo todo) {
        return TodoItem(
          todo: todo,
          onTodoChanged: handleTodoChange,
          todos: ref.watch(todosProvider).todos,
        );
      }).toList(),
      // onReorder: (int oldIndex, int newIndex) {
      //   setState(() {
      //     if (oldIndex < newIndex) {
      //       newIndex -= 1;
      //     }
      //     final widget = normaltodos.removeAt(oldIndex);
      //     normaltodos.insert(newIndex, widget);
      //   });
      // },
      // children: TodoItem,
    );
  }

  Widget searchlistview(){
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: ref.watch(todosProvider).todos.map((Todo todo) {
        return TodoItem(
            todo: todo,
            onTodoChanged: handleTodoChange,
          todos: ref.watch(todosProvider).todos
        );
      }).toList(),
    );
  }

  Widget searchTextField() {
    return TextField(
      onChanged: (String s) async{
        searchtodos= await taskrep.fetchTodoListByName(s);
        ref.watch(todosProvider).todos=searchtodos;
        setState(() {
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }


  }

