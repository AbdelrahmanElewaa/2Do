import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import '../Data/TasksData.dart';

class timepickerobj extends StatefulWidget {
  const timepickerobj({Key? key}) : super(key: key);

  @override
  State<timepickerobj> createState() => timepickerobjState();
}

class timepickerobjState extends State<timepickerobj> {

  TextEditingController timeinput = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.fromDateTime(date);


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Todo todo;
      newtime = TimeOfDay.fromDateTime(date);
      // newtime.format(context)=todo.reminder;
      timeinput.text = newtime.format(context);
    });
    timeOfDay = newtime;

    //set the initial value of text field
    super.initState();
  }

  void onTimeChanged(TimeOfDay time) {
    setState(() {
      newtime = time;
      timeOfDay = time;
      timeinput.text = timeOfDay.format(context);
    });
  }

  void onTimeChanged2(DateTime time) {
    setState(() {
      date = DateTime(date.year,date.month,date.day,time.hour,time.minute,time.second);
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
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.timer,
                  color: Theme.of(context).colorScheme.primary,
                ),
                // hintText: 'Enter time of reminder',
                labelText: 'Reminder',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              readOnly: true,
              onTap: () {
                Navigator.of(context).push(
                  showPicker(
                    onChangeDateTime: onTimeChanged2,
                    context: context,
                    value: timeOfDay,
                    onChange: onTimeChanged,
                    minuteInterval: MinuteInterval.ONE,
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
    ));
    // );
  }
}
