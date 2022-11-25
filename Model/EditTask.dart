import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Data/TasksData.dart';
import 'package:todo/Widgets/adddialog.dart';
import 'package:todo/Widgets/multiselect.dart';
import 'package:todo/Widgets/timepicker.dart';
import 'package:todo/Model/TasksModel.dart';
import 'package:enum_to_string/enum_to_string.dart';

class EditTask extends StatefulWidget {
  final Todo todo;
  // final onTodoChanged;
  EditTask({
    required this.todo,
    // required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  @override
  edit createState() {
    return edit(todo: todo);
  }
}
// Create a corresponding State class. This class holds data related to the form.
class edit extends State<EditTask>  with SingleTickerProviderStateMixin {
  final Todo todo;
  // final onTodoChanged;
  edit({
    required this.todo,
    // required this.onTodoChanged,
  }) : super( );

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  late AnimationController lc;

  @override
  void initState() {
    nameController.text=todo.name;
    descriptionController.text=todo.description;
    timeController.text=todo.reminder;
    super.initState();

    lc = AnimationController(
      vsync: this,
    );
    lc.addStatusListener((status)  {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).go('/TodoList');
        context.goNamed(
          "home",
          params: { "selectedIndex":"2"},
        );
        // lottieController.clearListeners();
      }
    });
  }

  @override
  void dispose() {
    lc.dispose();
    // lottieController.
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return
      Scaffold(
        appBar:  AppBar(
          title:  const Text('Todo list'),
        ),
        body:  SingleChildScrollView(
          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is empty';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.label_important_rounded),
                    hintText: 'Enter task name',
                    // labelText: todo.name,
                    // tex
                  ),
                ),
                // Text(todo.name),
                TextFormField(
                  controller: descriptionController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Description is empty';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.edit_note),
                    hintText: 'Enter task description',
                    labelText: 'Description',
                  ),
                ),
                timepicker(),
                SizedBox(
                  height: 20,
                ),
                multiselect(),
                Center(
                  // padding: const EdgeInsets.only( top: 40.0),
                  child: ElevatedButton(

                    child: const Text('Submit'),
                    onPressed: ()  {
                      // showSuccessfulDialog();
                      if (_formKey.currentState!.validate()) {
                        multiselectState().selected.toString();
                        todos.remove(todo);
                        addTodoItem(name: nameController.text, des:  descriptionController.text, rem: timepickerState().timeinput.text, cat: multiselectState().selected    );
                        showSuccessfulDialog();
                        // GoRouter.of(context).go('/TodoList')
                      };
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  void showSuccessfulDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(

        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100.2),
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/added.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                  controller: lc,
                  onLoaded: (composition) {
                    lc.duration = composition.duration;
                    lc.forward().whenComplete(() => GoRouter.of(context).go('/TodoList'));
                  }
              ),
              const Center(
                child: Text("Updated!", style: TextStyle(
                    color: Color.fromARGB(140, 255, 193, 7),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),),
              ),
              const SizedBox(height: 21),
            ]
        ),
      )
  );

}




