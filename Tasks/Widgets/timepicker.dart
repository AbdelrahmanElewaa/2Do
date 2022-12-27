import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import '../Data/TasksData.dart';


class timepicker extends StatefulWidget {
  const timepicker({Key? key}) : super(key: key);

  @override
  State<timepicker> createState() => timepickerState();
}

class timepickerState extends State<timepicker> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  // String rem= timeOfDay.format(context);
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }
  void onTimeChanged(TimeOfDay time) {
    setState(() {
      timeOfDay = time;
      timeinput.text = timeOfDay.format(context);
      newtime=time;
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
                    decoration:  InputDecoration(
                      icon:  Icon(Icons.timer, color: Theme.of(context).colorScheme.primary,),
                      // hintText: 'Enter time of reminder',
                      labelText: 'Reminder',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary,),
                    ),
                    readOnly: true,
                    onTap:() {
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: timeOfDay,
                          onChange: onTimeChanged,
                          minuteInterval: MinuteInterval.ONE,
                          is24HrFormat: false,
                          moonAsset: Image.asset('assets/moon.png'),
                          sunAsset: Image.asset('assets/sun.png'),
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
