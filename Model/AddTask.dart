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

class AddTask extends StatefulWidget {
  @override
  add createState() {
    return add();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class add extends State<AddTask>  with SingleTickerProviderStateMixin {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  late AnimationController lottieController;

  @override
  void initState() {
    super.initState();

    lottieController = AnimationController(
      vsync: this,
    );
    lottieController.addStatusListener((status)  {
      if (status == AnimationStatus.completed) {
        // GoRouter.of(context).go('/TodoList');
        context.goNamed(
          "home",
        params: { "selectedIndex":"2"},
        );

      }
    });
  }



  @override
  void dispose() {
    lottieController.dispose();
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

          key: _formKey,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              TextFormField(
                cursorColor: Colors.blue,

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
                  labelText: 'Name',
                ),
              ),
              
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
style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
),
                    child: const Text('Submit'),
                    onPressed: () async {
    if (_formKey.currentState!.validate()) {
        multiselectState().selected.toString();
        addTodoItem(name: nameController.text, des:  descriptionController.text, rem: timepickerState().timeinput.text, cat: multiselectState().selected    );
        showSuccessfulDialog();
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
                  controller: lottieController,
                  onLoaded: (composition) {
                    lottieController.duration = composition.duration;
                    lottieController.forward();
                  }
              ),
              const Center(
                child: Text("Added!", style: TextStyle(
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




