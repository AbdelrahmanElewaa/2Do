import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../../Helper/notificationservice.dart';
import '../../Shared/Widgets/iconn.dart';
import '../Data/tasksRepository.dart';
import '../Widgets/multiselect.dart';
import '../Widgets/timepicker.dart';

class AddTask extends StatefulWidget {
  @override
  add createState() {
    return add();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class add extends State<AddTask> with SingleTickerProviderStateMixin {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  late AnimationController lottieController;
  TimeOfDay timeOfDay = TimeOfDay.now();
  final taskrep = TasksRepository.instance;

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
        // GoRouter.of(context).go('/TodoList');
        context.goNamed(
          "home",
          params: {"selectedIndex": "2"},
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
            leading: BackButton(
                color: Theme.of(context).colorScheme.primary // <-- SEE HERE
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
                              color: Theme.of(context).colorScheme.primary),
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
                            taskrep
                                .insert(
                                    name: nameController.text,
                                    checked: "false",
                                    cat: selected.name,
                                    rem: date.toIso8601String(),
                                    shared: "false",
                                    des: descriptionController.text)
                                .then((value) {
                              NotificationService().showNotification(
                                  id: value,
                                  title: nameController.text,
                                  body: descriptionController.text,
                                  tod: date);
                            });
                            showSuccessfulDialog();
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
