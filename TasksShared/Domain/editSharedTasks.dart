import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Widgets/multiselectobj.dart';
import 'package:todo/TasksShared/Data/tasksFirestore.dart';
import '../../Helper/notificationservice.dart';
import '../../Home/View/home_page.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Tasks/Widgets/timepickerobj.dart';
import '../Data/sharedTasksData.dart';
import 'SharedTasksModel.dart';

class EditSharedTask extends StatefulWidget {
  final SharedTodo todo;
  // final onTodoChanged;
  EditSharedTask({
    required this.todo,
    // required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  @override
  editShared createState() {
    return editShared(todo: todo);
  }
}

// Create a corresponding State class. This class holds data related to the form.
class editShared extends State<EditSharedTask>
    with SingleTickerProviderStateMixin {
  // final taskrep = TasksRepository.instance;
  final SharedTodo todo;

  // final onTodoChanged;
  editShared({
    required this.todo,
    // required this.onTodoChanged,
  }) : super();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _fk = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late AnimationController lc;
  String uid = ' ';

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
          MaterialPageRoute(builder: (context) => SharedTodoList()),
        );
      }
    });

    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        // GoRouter.of(context).go('/login');
        context.go('/login');
      } else {
        // setState(() {
        uid = user.uid;
        // });

        print('User is signed in!');
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
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        title: Text(
          'Todo list',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fk,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
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
                      child: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Theme.of(context).colorScheme.secondary,
                                    onPrimary:
                                        Theme.of(context).colorScheme.primary,
                                    onSurface: Colors.black, // background color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedDate != null) {
                            date = pickedDate;
                          } else
                            date = DateTime.now();
                        },
                        icon: Iconn(
                          icN: Icons.date_range_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
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
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text('Submit'),
                    onPressed: () async {
                      if (_fk.currentState!.validate()) {
                        todo.name = nameController.text;
                        todo.description = descriptionController.text;
                        todo.reminder = date.toIso8601String();
                        todo.cat = selected.name;
                        editTask(todo, uid);

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
