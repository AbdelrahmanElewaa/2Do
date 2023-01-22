import 'package:dismissible_page/dismissible_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:todo/TasksShared/Data/tasksFirestore.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Tasks/Widgets/multiselect.dart';
import '../../Tasks/Widgets/timepicker.dart';
import '../../Helper/notificationservice.dart';
import '../../User/Data/UserFirestore.dart';
import 'SharedTasksModel.dart';

class AddSharedTask extends StatefulWidget {
  @override
  addshare createState() {
    return addshare();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class addshare extends State<AddSharedTask>
    with SingleTickerProviderStateMixin {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController shareController = TextEditingController();
  late AnimationController lottieController;
  TimeOfDay timeOfDay = TimeOfDay.now();
  String uid = ' ';

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    selected = category.other;
    lottieController = AnimationController(
      vsync: this,
    );
    lottieController.addStatusListener((status) {
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
        uid = user.uid;
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  void gettime() {}
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return DismissiblePage(
      isFullScreen: true,
      direction: DismissiblePageDismissDirection.multi,
      // behavior: HitTestBehavior.translucent,
      onDismissed: () {
        Navigator.of(context).pop();
      },
      child: Hero(
        tag: 'unique tag',
        child: Scaffold(
          appBar: AppBar(
            leading:  IconButton(
              icon: Iconn(
                icN: Icons.arrow_back_ios_new,
              ),
              onPressed: () => context.go('/sharedtasks'),
            ),
            title: Text(
              'Todo list',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
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
                          )),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Description is empty';
                        }
                        return null;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.edit_note,
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
                    TextFormField(
                      cursorColor: Colors.blue,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Shared with is empty';
                        }
                        return null;
                      },
                      controller: shareController,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.label_important_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          hintText: 'Enter shared with uid',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          labelText: 'Shared with',
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          )),
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
                                        primary: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPrimary: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onSurface:
                                            Colors.black, // background color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary:
                                              Colors.red, // button text color
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
                        Text(
                          "Date",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      ],
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
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text('Submit'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool found = await findUser(shareController.text);
                            if (found == false) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("User not found!"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              createTask(
                                      name: nameController.text,
                                      checked: "false",
                                      cat: selected.name,
                                      des: descriptionController.text,
                                      rem: date.toIso8601String(),
                                      shared: "true",
                                      uid: uid,
                                      sharedwith: shareController.text)
                                  .then((id) async {
                                await createTask(
                                    name: nameController.text,
                                    checked: "false",
                                    cat: selected.name,
                                    des: descriptionController.text,
                                    rem: date.toIso8601String(),
                                    shared: "true",
                                    uid: shareController.text,
                                    sharedwith: uid,
                                    taskid: id);
                              });

                              showSuccessfulDialog();
                            }
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Lottie.asset("assets/added.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                  controller: lottieController, onLoaded: (composition) {
                lottieController.duration = composition.duration;
                lottieController.forward();
              }),
              const Center(
                child: Text(
                  "Added!",
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
