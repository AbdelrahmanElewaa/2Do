// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:todo/util/colorextension.dart';
import 'package:flutter/material.dart';
import 'package:todo/util/settingsbutton.dart';
import '../util/tasks_tile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../util/calenderweek.dart';
import 'package:intl/intl.dart';
import '../util/searchbar.dart';
class home extends StatelessWidget {
  home({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
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
                          formattedDate,
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
//Settings
                    SettingsButton()
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                //Search Bar
                SearchBar(),
                SizedBox(
                  height: 25,
                ),
                 
//Calender

                Calenderweek(),
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
                              fontSize: 30,
                              color: Color.fromARGB(255, 12, 34, 51)),
                        ),


                        //ADD Button
                         ElevatedButton(
                      onPressed:(){GoRouter.of(context).go('/TodoList');}, child: Icon(Icons.add ,size: 40,),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.red
                        
                      ),),



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
