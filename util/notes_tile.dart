import 'package:flutter/material.dart';
import '../util/drop_down.dart';

class NotesTile extends StatelessWidget {
  final String taskName;
  final String subTitle;
  final color;
  const NotesTile({
    Key? key,
    required this.taskName,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 214, 193, 130),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
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
          ],
        ),
      ),
    );
  }
}
