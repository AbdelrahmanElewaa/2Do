import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Helper/notificationservice.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/globals.dart';
import '../../Home/View/home_page.dart';
import '../Data/tasksRepository.dart';
import 'EditTask.dart';
import 'package:todo/Tasks/Data/providers.dart';

class TodoItem extends StatefulWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
    required this.todos
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  final List<Todo>todos;


  @override
  State<TodoItem> createState() =>
      TodoItemState(onTodoChanged: onTodoChanged, todo: todo,todos: todos);
}

class TodoItemState extends State<TodoItem> {
  TodoItemState({
    required this.todo,
    required this.onTodoChanged,
    required this.todos
  }) : super();

  final Todo todo;
  final onTodoChanged;
  final List<Todo>todos;
  final taskrep = TasksRepository.instance;
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
    // final data = ref.watch(todoprovider);
// data.
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
                // setState(() {
                  taskrep.delete(todo.id);
                  todos.remove(todo);
                // });

                NotificationService().deleteNotification(todo.id!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Todo successfully deleted!!'),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        taskrep.insertTodo(todo).then((value) {
                          NotificationService().showNotification(
                              id: value,
                              title: todo.name,
                              body: todo.description,
                              tod: DateTime.parse(todo.reminder));

                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage(
                                  selectedIndex: 2,
                                )));
                      }
                          // setState(() {

                          // })
                  ),
                ));
              }),
          children: [
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              onPressed: (context) {
                // setState(() {
                  taskrep.delete(todo.id);
                  todos.remove(todo);
                // });
                NotificationService().deleteNotification(todo.id!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Todo successfully deleted!!'),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () =>
                          // setState(() {
                            taskrep.insertTodo(todo).then((value) {
                              NotificationService().showNotification(
                                  id: value,
                                  title: todo.name,
                                  body: todo.description,
                                  tod: DateTime.parse(todo.reminder));
                            }),
                          // })
                  ),
                ));
              },
              // ).onDismissed();// Noti
              // },
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
          // color: Color.fromRGBO(10, 145, 171, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).primaryColor,
          // color: Colors.amber,

          child: ListTile(
            onTap: () {
              // TodoListState.listClick(imageGlobalKey);
              onTodoChanged(todo);
            },
            leading: Container(
              // key: gk[globalKeyGenerator.nextkeyid()],
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
