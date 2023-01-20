// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/drawerr.dart';
import '../../Tasks/Domain/AddTask.dart';
import '../Widgets/tasks_tile.dart';
import 'package:intl/intl.dart';
import 'package:dismissible_page/dismissible_page.dart';
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Data/TasksData.dart';
import '../../Tasks/Domain/TasksModel2.dart';
import 'home_bottom.dart';

class HomeVertical extends StatefulWidget {
  HomeVertical({super.key});

  @override
  State<HomeVertical> createState() => _HomeVerticalState();
}

class _HomeVerticalState extends State<HomeVertical> {
  late DateTime _selectedDate = DateTime.now();

  final taskrep = TasksRepository.instance;
  List<Todo> todoss = [];
  @override
  void initState() {
    taskrep.fetchTodoList().then((value) {
      setState(() {
        for (int i = 0; i < value.length; i++) {
          if (value[i].reminder.substring(0, 10) ==
              DateFormat('yyyy-MM-dd').format(DateTime.now())) {
            todoss.add(value[i]);
          }
        }
        //todoss = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxx(h: 5.0),
        //greating Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBoxx(
                h: 10.0,
              ),
              CalendarTimeline(
                initialDate: _selectedDate,
                firstDate: DateTime(2015, 1, 15),
                lastDate: DateTime(2030, 11, 20),
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                    todoss = [];
                    taskrep.fetchTodoList().then((value) {
                      setState(() {
                        if (date == null) {
                          for (int i = 0; i < value.length; i++) {
                            if (value[i].reminder.substring(0, 10) ==
                                DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now())) {
                              todoss.add(value[i]);
                            }
                          }
                        } else {
                          print(DateFormat('yyyy-MM-dd').format(date));

                          for (int i = 0; i < value.length; i++) {
                            if (value[i].reminder.substring(0, 10) ==
                                DateFormat('yyyy-MM-dd').format(date)) {
                              todoss.add(value[i]);
                            }
                          }
                        }
                      });
                    });
                    HomeBottom(todoss: todoss);
                  });
                },
                leftMargin: 20,
                dayNameColor: Color.fromARGB(255, 255, 7, 7),
                monthColor: Theme.of(context).colorScheme.primary,
                dayColor: Theme.of(context).colorScheme.primary,
                activeDayColor: Theme.of(context).scaffoldBackgroundColor,
                activeBackgroundDayColor:
                    Theme.of(context).colorScheme.secondary,
                dotsColor: Colors.blue,
                locale: 'en_ISO',
              ),
              //Calender

              SizedBoxx(
                h: 25.0,
              ),
            ],
          ),
        ),
        HomeBottom(todoss: todoss),
      ],
    );
  }
}
