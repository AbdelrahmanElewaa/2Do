import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const DayNight());
// }
//
// class DayNight extends StatefulWidget {
//   const DayNight({Key? key}) : super(key: key);
//
//   @override
//   State<DayNight> createState() => _DayNightState();
// }
//
// class _DayNightState extends State<DayNight> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "DayNight",
//       theme: ThemeData(primaryColor: Color.fromARGB(255, 25, 71, 133)),
//       debugShowCheckedModeBanner: false,
//       home: const Home(),
//     );
//   }
// }
class timepicker extends StatefulWidget {
  const timepicker({Key? key}) : super(key: key);

  @override
  State<timepicker> createState() => timepickerState();
}

class timepickerState extends State<timepicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }
  void onTimeChanged(TimeOfDay time) {
    setState(() {
      _timeOfDay = time;
      timeinput.text = _timeOfDay.format(context);
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
                          value: _timeOfDay,
                          onChange: onTimeChanged,
                          minuteInterval: MinuteInterval.FIVE,
                          is24HrFormat: false,
                          moonAsset: Image.asset('assets/moon.png'),
                          sunAsset: Image.asset('assets/sun.png'),
                        ),
                      );


                      
                    },
                      


                  ),
                  // Text(
                  //   _timeOfDay.format(
                  //     context,
                  //   ),
                  //   style: Theme.of(context).textTheme.headlineLarge,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         showPicker(
                  //           context: context,
                  //           value: _timeOfDay,
                  //           onChange: onTimeChanged,
                  //           minuteInterval: MinuteInterval.FIVE,
                  //           is24HrFormat: false,
                  //           moonAsset: Image.asset('moon.png'),
                  //           sunAsset: Image.asset('sun.png'),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text("Pick Time "))
                ],
              ),
            ),
          )
    );
    // );
  }
}
