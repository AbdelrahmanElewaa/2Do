// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:todo/util/colorextension.dart';
import 'package:flutter/material.dart';
import '../util/tasks_tile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../util/calenderweek.dart';

class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
//greating Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Oct 2022',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 34, 51),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
//Notifcation
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(140, 255, 193, 7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/settings');
                        },
                        child: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 12, 34, 51),
                        ),
                      ),
                    )
                  ],
                ),
//Search Bar
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(140, 255, 193, 7),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 12, 34, 51),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Search',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 34, 51),
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

//Calender
    Calenderweek()
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Color.fromARGB(140, 255, 193, 7),
              child: Center(
                child: Column(
                  children: [
// Excercise Heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tasks',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 12, 34, 51)),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Color.fromARGB(255, 12, 34, 51),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
//Tasks Dashboard
                    Expanded(
                        child: ListView(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TasksTile(
                          icon: Icons.work,
                          taskName: 'Project Meeting',
                          subTitle: 'Emergency',
                          color: Colors.blue,
                        ),
                        TasksTile(
                          icon: Icons.sports_gymnastics,
                          taskName: 'Gym',
                          subTitle: 'Sports',
                          color: Colors.green,
                        ),
                        TasksTile(
                          icon: Icons.dinner_dining,
                          taskName: 'Dinner',
                          subTitle: 'Appoitment',
                          color: Colors.red,
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
// ADD Button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/TodoList');
                        },
                        child: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 12, 34, 51),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
