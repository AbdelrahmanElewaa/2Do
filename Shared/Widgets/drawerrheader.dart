// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:todo/Shared/Widgets/sizedboxx.dart';
import 'package:todo/Shared/Widgets/textt.dart';
import 'package:todo/globals.dart';
// import 'package:todo/Common%20widgets/textt.dart';

class DrawerrHeader extends StatelessWidget {
  const DrawerrHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 190.0,
        child: DrawerHeader(
          child: Column(
            children: [
              currUser==null
                  ?  Icon(
                Icons.account_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 80,
              )
                  : CircleAvatar(
                radius: 50.0,
                backgroundImage:
                NetworkImage(currUser!.profileURL),
                backgroundColor: Colors.transparent,
              ),
              SizedBoxx(h: 5.0),
              currUser==null?
              Textt(
                text: 'User',
                size: 30.0,
              ):Textt(
                text: currUser!.name,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
