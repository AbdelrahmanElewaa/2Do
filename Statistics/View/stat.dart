// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo/Statistics/Widgets/piechart.dart';

import '../../Shared/Widgets/sizedboxx.dart';
// import '../../Common widgets/sizedboxx.dart';

class Stat extends StatefulWidget {
  Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBoxx(
              h: 20.0,
            ),
            //greating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //Calender

                  Container(
                    
                    height: MediaQuery.of(context).size.height / 2.3,
                    child: TableCalendar(
                      calendarFormat: CalendarFormat.month,
                      weekendDays: const [
                        DateTime.friday,
                        DateTime.saturday,
                      ],
                      calendarStyle: CalendarStyle(
                        
                       weekendTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 17,),
                        defaultTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary ,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          weekdayStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary ,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      headerStyle: HeaderStyle(
                        
                          titleTextStyle:
                              TextStyle(color:Theme.of(context).colorScheme.primary)),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  )
                ],
              ),
            ),
            SizedBoxx(h: 20.0),
            Pie(),
          ],
        ),
      ),
    );
  }
}
