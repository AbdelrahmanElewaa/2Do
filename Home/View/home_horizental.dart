import 'package:calendar_timeline/calendar_timeline.dart';
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

class HomeHorizental extends StatefulWidget {
  const HomeHorizental({super.key});

  @override
  State<HomeHorizental> createState() => _HomeHorizentalState();
}

class _HomeHorizentalState extends State<HomeHorizental> {
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
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //    SizedBoxx(h: 10.0),
              //greating Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    CalendarTimeline(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 1, 15),
                      lastDate: DateTime(2030, 11, 20),
                      onDateSelected: (date) {
                        setState(() {
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
                      dotsColor: Color.fromARGB(255, 0, 89, 255),
                      locale: 'en_ISO',
                    ),
                  ],
                ),
              ),
              // SizedBoxx(
              //   h: 8.0,
              // ),
              HomeBottom(todoss: todoss),
            ],
          ),
        ),
      ),
    );
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
