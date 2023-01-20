import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Shared/Widgets/sizedboxx.dart';
import '../../Tasks/Data/TasksData.dart';
import '../../Tasks/Domain/AddTask.dart';
import '../Widgets/tasks_tile.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({
    Key? key,
    required this.todoss,
  }) : super(key: key);

  final List<Todo> todoss;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    'Today\'s Tasks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
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
              SizedBoxx(h: 20.0),
              //Tasks Dashboard
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: todoss.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == todoss.length) {
                        return Text(
                          '',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        );
                      }

                      return TasksTile(
                        icon: Icons.task,
                        taskName: '${todoss[index].name}',
                        subTitle: '${todoss[index].cat}',
                        // subTitle: '$date',
                        date: '${todoss[index].reminder.substring(0, 10)}',
                        time: '${todoss[index].reminder.substring(11, 16)}',
                        info: '${todoss[index].description}',
                        color: Colors.orange,
                      );
                    }),
                // SizedBoxx(
                //   h: 8.0,
              ) // ),
            ],
          ),
        ),
      ),
    );
  }
}
