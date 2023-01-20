import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo/Statistics/Widgets/piechart.dart';

import '../../Shared/Widgets/sizedboxx.dart';

class StatHorizental extends StatefulWidget {
  const StatHorizental({super.key});

  @override
  State<StatHorizental> createState() => _StatHorizentalState();
}

class _StatHorizentalState extends State<StatHorizental> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                //Calender

                Container(
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.twoWeeks,
                    weekendDays: const [
                      DateTime.friday,
                      DateTime.saturday,
                    ],
                    calendarStyle: CalendarStyle(
                      weekendTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                      ),
                      defaultTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        weekdayStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                  ),
                )
              ],
            ),
          ),
         //SizedBoxx(h: 20.0),
          Pie(),
        ],
      ),
    );
  }
}
