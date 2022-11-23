import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Model/note_model.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/util/colorextension.dart';
import 'package:todo/util/settingsbutton.dart';
import '../util/drawerr.dart';
import '../util/tasks_tile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../util/calenderweek.dart';
import '../util/searchbar.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawerr(),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            //greating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Search Bar
                  SearchBar(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.transparent,
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
                                fontSize: 30,
                                color: Color.fromARGB(255, 12, 34, 51)),
                          ),

                          //ADD Button
                          ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).go('/addtask');
                            },
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Colors.red),
                          ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
