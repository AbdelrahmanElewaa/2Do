import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Model/note_model.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/util/colorextension.dart';
import 'package:todo/util/settingsbutton.dart';
import '../util/drawerr.dart';
import '../util/notes_tile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../util/calenderweek.dart';
import '../util/notes_searchbar.dart';

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
                  NotesSearchbar(),
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
                            'Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 12, 34, 51)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Notes Dashboard
                      Container(
                        height: 100,
                        child: Expanded(
                            child: ListView(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go('/notesdetails');
                              },
                              child: NotesTile(
                                taskName: 'Orders',
                                subTitle: '2:12 PM oil',
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yesterday',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 12, 34, 51)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Notes Dashboard
                      Container(
                        height: 150,
                        child: Expanded(
                            child: ListView(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go('/notesdetails');
                              },
                              child: NotesTile(
                                taskName: 'meeting',
                                subTitle: 'yesterday postpone the ...',
                                color: Colors.white30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go('/notesdetails');
                              },
                              child: NotesTile(
                                taskName: 'theory',
                                subTitle: 'yesterday 6,7,8,9',
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        )),
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
