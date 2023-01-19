// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/Shared/Widgets/sizedboxx.dart';

import '../../Shared/Widgets/drop_down.dart';

class TasksTile extends StatelessWidget {
  final icon;
  final String taskName;
  final String subTitle;
    final String time;
final String date;
  final color;
  const TasksTile({
    Key? key,
    required this.icon,
    required this.taskName,
    required this.subTitle,
    required this.color,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      padding: EdgeInsets.all(16),
                      color: color,
                      child: Icon(
                        icon,
                        color: Color.fromRGBO(12, 34, 51, 1),
                      )),
                ),
                SizedBoxx(
                  w: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      taskName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBoxx(h: 5.0),
                    //sub title
                    Text(subTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
Text(date,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                        Text(time,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        )),

                        
                  ],
                ),
              ],
            ),
            DropDown(),
          ],
        ),
      ),
    );
  }
}
