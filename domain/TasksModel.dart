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
import 'TasksModel2.dart';

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
              return TodoItemState(
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


