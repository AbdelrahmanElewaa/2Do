import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../util/drawerr.dart';
import '../util/notes_tile.dart';

import '../util/notes_searchbar.dart';
import '../util/sizedboxx.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //greating Row
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 10),
              child: Column(
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBoxx(
                    h: 20.0,
                  ),

                  //Search Bar
                  NotesSearchbar(),
                ],
              ),
            ),
            SizedBoxx(
              h: 20.0,
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
                      SizedBoxx(
                        h: 15.0,
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
                      SizedBoxx(
                        h: 15.0,
                      ),
                      //Notes Dashboard
                      Container(
                        height: 150,
                        child: Expanded(
                            child: ListView(
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
