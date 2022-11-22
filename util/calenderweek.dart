import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo/util/colorextension.dart';
import 'package:flutter/material.dart';
class Calenderweek extends StatefulWidget {
  const Calenderweek({super.key});

  @override
  State<Calenderweek> createState() => _CalenderweekState();
}

class _CalenderweekState extends State<Calenderweek> {
  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
  initialDate: DateTime.now(),
  firstDate: DateTime(2015, 1, 15),
  lastDate: DateTime(2030, 11, 20),
  onDateSelected: (date) => print(date),
  leftMargin: 20,
  monthColor: Colors.black,
  dayColor: Colors.black,
  activeDayColor: Colors.red,
  activeBackgroundDayColor: Colors.amber,
  dotsColor: Color(0xFF333A47),
  selectableDayPredicate: (date) => date.day != 23,
  locale: 'en_ISO',
);
  }
}