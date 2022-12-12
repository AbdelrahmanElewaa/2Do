import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Data/TasksData.dart';
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/domain/AddTask.dart';
import 'package:todo/domain/taskDescription.dart';
import 'package:todo/view/home_page.dart';
import 'EditTask.dart';

class TodoItem extends StatelessWidget {
  final GlobalKey imageGlobalKey = GlobalKey();
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
            dismissible: DismissiblePane(
              // closeOnCancel: true,
              key: ValueKey("delete"),
                onDismissed: ()
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
              SlidableAction(
                onPressed: (context) {
                    todos.remove(todo);
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
                  TodoListState.listClick(imageGlobalKey);
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
              key: imageGlobalKey,
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

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  static GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  static late Function(GlobalKey) runAddToCardAnimation;
  static var _cartQuantityItems = 0;
  @override
  void initState() {
    todos;
  } // final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      gkCart: gkCart,
      rotation: true,
      dragToCardCurve: Curves.easeIn,
      dragToCardDuration: const Duration(milliseconds: 1000),
      previewCurve: Curves.linearToEaseOut,
      previewDuration: const Duration(milliseconds: 500),
      previewHeight: 30,
      previewWidth: 30,
      opacity: 0.85,
      initiaJump: false,
      receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
        // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
        runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: SafeArea(
        child: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: false,
            title: Text("Tasks"),
            actions: [
              AddToCartIcon(
              key: gkCart,
              icon: Icon(Icons.people,color: Colors.white),
              )
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
  static void listClick(GlobalKey gkImageContainer) async {
    await runAddToCardAnimation(gkImageContainer);
    await gkCart.currentState!.runCartAnimation((++_cartQuantityItems).toString());
  }
}


