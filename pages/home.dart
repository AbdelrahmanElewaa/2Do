// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../util/drawerr.dart';
import '../util/sizedboxx.dart';
import '../util/tasks_tile.dart';
import '../util/calenderweek.dart';
import 'package:intl/intl.dart';
import '../util/searchbar.dart';

class home extends StatelessWidget {
  home({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        drawer: Drawerr(),
        body: Column(
          children: [
            SizedBoxx(h: 10.0),
            //greating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBoxx(
                    h: 10.0,
                  ),
                  Calenderweek(),
                  //Calender

                  SizedBoxx(
                    h: 25.0,
                  ),

                  //Search Bar
                  SearchBar(),
                ],
              ),
            ),
            SizedBoxx(h: 20.0),
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
                          Text('Tasks',
                              style: Theme.of(context).textTheme.bodyText1),

                          //ADD Button
                          ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).go('/addtask');
                            },
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBoxx(h: 20.0),
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
                      SizedBoxx(
                        h: 8.0,
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
