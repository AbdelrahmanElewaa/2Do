import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../../helper/notificationservice.dart';
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
class add extends State<AddTask>  with SingleTickerProviderStateMixin {
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
  void gettime(){}
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return
      DismissiblePage(
        isFullScreen: true,
        direction: DismissiblePageDismissDirection.multi,
        // behavior: HitTestBehavior.translucent,
        onDismissed: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: 'unique tag',
          child: Scaffold(
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
                      decoration:  InputDecoration(
                        icon: Icon(Icons.label_important_rounded, color: Theme.of(context).colorScheme.primary,),
                        
                        hintText: 'Enter task name',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary,),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary,)
                        
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
                      decoration: InputDecoration(
                        icon:  Icon(Icons.edit_note, color: Theme.of(context).colorScheme.primary,),
                        hintText: 'Enter task description',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary,),
                        labelText: 'Description',
                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary,),
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
                            taskrep.insert(nameController.text, "false", selected.name, newtime.toString(), "false", descriptionController.text);
                          // Todo todo=  Todo(name: nameController.text, description:  descriptionController.text, reminder: newtime.toString(), cat: selected.name );
                          //   taskrep.update(todo);
                            // addTodoItem(name: nameController.text, des:  descriptionController.text, rem: newtime, cat: selected    );
                            // NotificationService().showNotification(
                            //     todos.last.id, nameController.text, descriptionController.text, newtime);
                            showSuccessfulDialog();
                          };
                        },
                      ),
                    ),
                  ],
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




