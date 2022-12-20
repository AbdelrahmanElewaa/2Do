// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../Shared/Widgets/sizedboxx.dart';
// import 'package:todo/Common%20widgets/sizedboxx.dart';

class ProfileListItem extends StatelessWidget {
  final header;
  final text;
  const ProfileListItem({super.key, required this.header, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SizedBoxx(w: 20.0),
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ]),
              Row(children: [
                SizedBoxx(w: 20.0),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Text('Update',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
