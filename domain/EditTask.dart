import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Data/TasksData.dart';
import 'package:todo/Widgets/adddialog.dart';
import 'package:todo/Widgets/multiselectobj.dart';
import 'package:todo/Widgets/timepicker.dart';
import 'package:todo/Domain/TasksModel.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:todo/view/home.dart';

import '../Widgets/timepickerobj.dart';
import '../helper/notificationservice.dart';
import '../view/home_page.dart';

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
  final _fk = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late AnimationController lc;

  @override
  void initState() {
    nameController.text=todo.name;
    descriptionController.text=todo.description;
    selected=todo.cat;
    newtime=todo.reminder;
    super.initState();

    lc = AnimationController(
      vsync: this,
    );

    lc.addStatusListener((status)  {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomePage(selectedIndex:2)),
        );
      }
    });
  }
  @override
  void dispose() {
    lc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return
      Scaffold(
        appBar:  AppBar(
          title:  const Text('Todo list'),
          backgroundColor: Colors.blue,
        ),
        body:  SingleChildScrollView(
          child: Form(
            key: _fk,

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
                timepickerobj(),
                SizedBox(
                  height: 20,
                ),
                multiselectobj(),
                Center(
                  // padding: const EdgeInsets.only( top: 40.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Submit'),
                    onPressed: () async {
                      if (_fk.currentState!.validate()) {
                        addTodoItem(name: nameController.text, des:  descriptionController.text, rem: newtime, cat: selected    );
                        // NotificationService().editNotification(
                        //   todo.id, todos.last.id, nameController.text, descriptionController.text, newtime);
                        todos.remove(todo);
                          showUpdatedDialog();
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

  void showUpdatedDialog() => showDialog(
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
                    lc.forward();
                    // lc.
                  }


              ),
              const Center(
                child: Text("Updated!", style: TextStyle(
                    color: Colors.blue,
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




