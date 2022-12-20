import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import '../Data/HiveDatabase.dart';
import '../Data/TaskDataHive.dart';
import 'TasksModel2.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;


class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  static GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  static late Function(GlobalKey) runAddToCardAnimation;
  static var _cartQuantityItems = 0;

  final _myBox = Hive.box<TodoHive>('todobox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is stack_trace.Trace) return stack.vmTrace;
      if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
      return stack;
    };
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("todolist") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }// final List<Todo> _todos = <Todo>[];

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
            children: db.todos.map((Todo todo) {
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
        final  widget = db.todos.removeAt(oldIndex);
        db.todos.insert(newIndex, widget);
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

    final item = db.todos.removeAt(oldIndex);
    setState(() {
      db.todos.insert(newIndex, item);
    });
  }
  static void listClick(GlobalKey gkImageContainer) async {
    await runAddToCardAnimation(gkImageContainer);
    await gkCart.currentState!.runCartAnimation((++_cartQuantityItems).toString());
  }
}


