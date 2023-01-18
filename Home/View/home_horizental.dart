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
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Data/TasksData.dart';
import '../../Tasks/Domain/TasksModel2.dart';

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
        todoss = value;
      });
    });
    super.initState();
  }

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
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: todoss.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == todoss.length) {
                            return ElevatedButton(
                              child: const Text('Refresh'),
                              onPressed: () {
                                taskrep.fetchTodoList().then((value) {
                                  setState(() {
                                    todoss = value;
                                  });
                                });
                              },
                            );
                          }
                          return TasksTile(
                            icon: Icons.dinner_dining,
                            taskName: '${todoss[index].name}',
                            subTitle: '${todoss[index].cat}',
                            color: Colors.red,
                          );
                        }),
                    // SizedBoxx(
                    //   h: 8.0,
                  ) // ),
                ],
              ),
            ),
          ),
        ),
        // SizedBoxx(
        //   h: 8.0,
        // ),
      ],
    );
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
