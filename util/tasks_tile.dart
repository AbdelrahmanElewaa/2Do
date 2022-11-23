import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final icon;
  final String taskName;
  final String subTitle;
  final color;
  const TasksTile({
    Key? key,
    required this.icon,
    required this.taskName,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.amber,
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
                SizedBox(
                  width: 12,
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
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //sub title
                    Text(subTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red,
                        )),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_horiz,
              color: Color.fromRGBO(12, 34, 52, 1),
            ),
          ],
        ),
      ),
    );
  }
}
