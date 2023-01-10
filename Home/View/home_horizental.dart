import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/drawerr.dart';
import '../../Tasks/Domain/AddTask.dart';
import '../Widgets/tasks_tile.dart';
import '../../Shared/Widgets/calenderweek.dart';
import 'package:intl/intl.dart';
import 'package:dismissible_page/dismissible_page.dart';
class HomeHorizental extends StatelessWidget {
  const HomeHorizental({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
        //    SizedBoxx(h: 10.0),
            //greating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // SizedBoxx(
                  //   h: 10.0,
                  // ),
                  Calenderweek(),
                  //Calender

                  // SizedBoxx(
                  //   h: 25.0,
                  // ),

                  //Search Bar
                //  SearchBar(),
                ],
              ),
            ),
           // SizedBoxx(h: 20.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),

                          //ADD Button
                          Hero(
                            tag: 'unique tag',
                            child: ElevatedButton(
                              onPressed: () {
                                context.pushTransparentRoute(AddTask());
                                // GoRouter.of(context).go('/addtask');
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
                          ),
                        ],
                      ),
                      //SizedBoxx(h: 20.0),
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
                      // SizedBoxx(
                      //   h: 8.0,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
  }
}