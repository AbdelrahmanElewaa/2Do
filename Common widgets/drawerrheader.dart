// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:todo/Common%20widgets/sizedboxx.dart';
import 'package:todo/Common%20widgets/textt.dart';

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
              CircleAvatar(
                  radius: 55, backgroundImage: AssetImage('assets/1024.png')),
              SizedBoxx(h: 5.0),
              Textt(
                text: 'Omar mohamed',
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
