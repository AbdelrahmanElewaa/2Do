import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import '../Data/TasksData.dart';
class timepickerobj extends StatefulWidget {
  final Todo todo;
  // final onTodoChanged;
  timepickerobj({
    required this.todo,
    // required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  @override
  State<timepickerobj> createState() => timepickerobjState(todo: todo);
}

class timepickerobjState extends State<timepickerobj> {
  final Todo todo;
  timepickerobjState({
    required this.todo,
    // required this.onTodoChanged,
  }) : super( );
  // TimeOfDay timeOfDay = TimeOfDay.now();
  TextEditingController timeinput = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  //text editing controller for text field

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timeinput.text = todo.reminder.format(context);

    });
    timeOfDay=todo.reminder;
     //set the initial value of text field
    super.initState();
  }
  void onTimeChanged(TimeOfDay time) {
    setState(() {
      todo.reminder = time;
      timeOfDay=time;
      timeinput.text = timeOfDay.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // controller: controller,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Reminder is empty';
                    }
                    return null;
                  },
                  controller: timeinput,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.timer),
                    // hintText: 'Enter time of reminder',
                    labelText: 'Reminder',
                  ),
                  readOnly: true,
                  onTap:() {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: timeOfDay,
                        onChange: onTimeChanged,
                        minuteInterval: MinuteInterval.FIVE,
                        is24HrFormat: false,
                        moonAsset: Image.asset('assets/moon.png'),
                        sunAsset: Image.asset('assets/sun.png'),
                        // onChangeDateTime:
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
    // );
  }
}
