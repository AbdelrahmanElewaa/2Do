import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/TasksShared/Data/tasksFirestore.dart';
import 'package:todo/TasksShared/Domain/editSharedTasks.dart';
import 'package:todo/globals.dart';
import '../Data/sharedTasksData.dart';
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Domain/EditTask.dart';
import 'package:todo/Tasks/Data/providers.dart';

class SharedTod extends StatefulWidget {
  SharedTod({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final SharedTodo todo;
  final onTodoChanged;
  // const SharedTod({super.key});

  @override
  State<SharedTod> createState() =>
      _SharedTodState(todo: todo, onTodoChanged: onTodoChanged);
}

class _SharedTodState extends State<SharedTod> {
  _SharedTodState({
    required this.todo,
    required this.onTodoChanged,
  }) : super();

  final SharedTodo todo;
  final onTodoChanged;
  final taskrep = TasksRepository.instance;
  String uid = ' ';

  @override
  void initState() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        // GoRouter.of(context).go('/login');
        context.go('/login');
      } else {
        uid = user.uid;
        print('User is signed in!');
      }
    });
  }

  TextStyle? _getTextStyle(String checked) {
    if (checked == "false") {
      // if (!checked) {
      return const TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.lineThrough,
      );
    }

    return TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 3,
      decorationColor: Theme.of(context).colorScheme.secondary,
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
          dismissible: DismissiblePane(
              // closeOnCancel: true,
              key: ValueKey("delete"),
              onDismissed: () {
                delete(todo, uid);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Todo successfully deleted!!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () => createTaskobj(todo: todo, uid: uid),
                    )));
              }),
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditSharedTask(todo: todo),
                  ),
                );
              },
              backgroundColor: Color.fromARGB(255, 71, 181, 255),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              onPressed: (context) {
                delete(todo, uid);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Todo successfully deleted!!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () => createTaskobj(todo: todo, uid: uid),
                    )));
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {},
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              onPressed: (context) async {},
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).primaryColor,
          child: ListTile(
            onTap: () {
              onTodoChanged(todo);
            },
            leading: Container(
              child: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.note_alt_outlined,
              ),
            ),
            title: Text(todo.name, style: _getTextStyle(todo.checked)),
          ),
        ),
      ),
    );
  }
}
