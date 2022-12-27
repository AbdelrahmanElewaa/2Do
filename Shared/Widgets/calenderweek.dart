import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
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
      monthColor:Theme.of(context).colorScheme.primary,
      dayColor: Theme.of(context).colorScheme.primary,
      activeDayColor: Theme.of(context).scaffoldBackgroundColor,
      activeBackgroundDayColor: Theme.of(context).colorScheme.secondary,
      dotsColor: Color(0xFF333A47),
      locale: 'en_ISO',
    );
  }
}
