import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../Data/HiveDatabase.dart';
import '../Data/TaskDataHive.dart';
import 'EditTask.dart';
import 'package:todo/Tasks/Data/providers.dart';

class TodoItem extends ConsumerWidget{
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  final _myBox = Hive.box<TodoHive>('todobox');
  ToDoDataBase db = ToDoDataBase();
  // final GlobalKey imageGlobalKey = GlobalKey();
  //  List<GlobalKey>gk=globalKeyGenerator().addgkfromtodos();

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
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(todoprovider);
    db.todos=data;
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
              onDismissed: ()
              {
                data.remove(todo);
                // db
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
            SlidableAction(
              onPressed: (context) {
                data.remove(todo);
                db.todos=data;
                db.updateDataBase();
                const snackBar = SnackBar(
                  content: Text('Item successfully deleted!!'),
                  backgroundColor:  Color.fromARGB(255, 71, 181, 255),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // ).onDismissed();// Noti
              // },
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
              onPressed:  (context) async {
                await Future.delayed(const Duration(milliseconds: 500),
                        (){
                      // TodoListState.listClick(gk[globalKeyGenerator.nextkeyid()]);
                    });

              },
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
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