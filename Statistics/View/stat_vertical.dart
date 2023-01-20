// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo/Statistics/Widgets/piechart.dart';

import '../../Shared/Widgets/sizedboxx.dart';
import '../../Tasks/Data/TasksData.dart';
import '../../Tasks/Data/tasksRepository.dart';
import 'utils.dart';

class StatVertical extends StatefulWidget {
  const StatVertical({super.key});

  @override
  State<StatVertical> createState() => _StatVerticalState();
}

class _StatVerticalState extends State<StatVertical> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = null;

  final taskrep = TasksRepository.instance;
  List<Todo> todoss = [];
  double checked = 0;
  @override
  void initState() {
    taskrep.fetchTodoList().then((value) {
      setState(() {
        if (_selectedDay == null) {
          todoss = value;
        } else {
          for (int i = 0; i < value.length; i++) {
            if (value[i].reminder.substring(0, 10) ==
                DateFormat('yyyy-MM-dd').format(_selectedDay!)) {
              todoss.add(value[i]);
            }
          }
        }

        for (int i = 0; i < todoss.length; i++) {
          if (todoss[i].checked == "true") {
            checked++;
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      todoss = [];
                      checked = 0;
                      taskrep.fetchTodoList().then((value) {
                        setState(() {
                          if (_selectedDay == null) {
                            todoss = value;
                          } else {
                            print(
                                DateFormat('yyyy-MM-dd').format(_selectedDay!));

                            for (int i = 0; i < value.length; i++) {
                              if (value[i].reminder.substring(0, 10) ==
                                  DateFormat('yyyy-MM-dd')
                                      .format(_selectedDay!)) {
                                todoss.add(value[i]);
                              }
                            }
                          }

                          for (int i = 0; i < todoss.length; i++) {
                            if (todoss[i].checked == "true") {
                              checked++;
                            }
                          }
                        });
                      });
                      Pie(
                          s: _selectedDay,
                          list: todoss.length.toDouble(),
                          checked: checked);
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ],
            ),
          ),
          SizedBoxx(h: 20.0),

          Expanded(
              child: Pie(
                  s: _selectedDay,
                  list: todoss.length.toDouble(),
                  checked: checked)),
        ],
      ),
    );
  }
}
