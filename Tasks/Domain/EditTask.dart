import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Widgets/multiselectobj.dart';
import '../../Helper/notificationservice.dart';
import '../../Home/View/home_page.dart';
import '../../Shared/Widgets/iconn.dart';
import '../Data/tasksRepository.dart';
import '../Widgets/timepickerobj.dart';

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
class edit extends State<EditTask> with SingleTickerProviderStateMixin {
  final taskrep = TasksRepository.instance;
  final Todo todo;
  // final onTodoChanged;
  edit({
    required this.todo,
    // required this.onTodoChanged,
  }) : super();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _fk = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late AnimationController lc;

  @override
  void initState() {
    nameController.text = todo.name;
    descriptionController.text = todo.description;
    selected = valuecategory(todo.cat);
    date = DateTime.parse(todo.reminder);
    super.initState();

    lc = AnimationController(
      vsync: this,
    );

    lc.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(selectedIndex: 2)),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
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
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.label_important_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hintText: 'Enter task name',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  // labelText: todo.name,
                  // tex
                ),
              ),
              // Text(todo.name),
              TextFormField(
                controller: descriptionController,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Description is empty';
                  }
                  return null;
                },
                maxLines: 5,
                decoration: InputDecoration(
                  icon: Icon(Icons.edit_note,
                      color: Theme.of(context).colorScheme.primary),
                  hintText: 'Enter task description',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15)),
                    child:   IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:  DateTime.now(),
                            lastDate: DateTime(2050));
                        if(pickedDate!=null){
                          date=pickedDate;
                        }
                        else
                          date=DateTime.now();

                      },
                      icon: Iconn(
                        icN: Icons.date_range_outlined,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("Date")
                ],

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
                      todo.name = nameController.text;
                      todo.description = descriptionController.text;
                      todo.reminder = date.toIso8601String();
                      todo.cat = selected.name;
                      taskrep.update(todo);
                      NotificationService().editNotification(
                        id:  todo.id!,
                       title:    nameController.text,
                        body:   descriptionController.text,
                         tod:  date);
                     showUpdatedDialog();
                    }
                    ;
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Lottie.asset("assets/added.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                  controller: lc, onLoaded: (composition) {
                lc.duration = composition.duration;
                lc.forward();
                // lc.
              }),
              const Center(
                child: Text(
                  "Updated!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 21),
            ]),
          ));
}
