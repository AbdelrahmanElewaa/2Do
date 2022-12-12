// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Common%20widgets/drawerrheader.dart';
import 'package:todo/Common%20widgets/sizedboxx.dart';
import 'package:todo/Common%20widgets/textt.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerrHeader(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              GoRouter.of(context).go('/account');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text(' Login '),
            onTap: () {
              GoRouter.of(context).go('/login');
            },
          ),
          SizedBoxx(h: 310.0),
          Column(
            children: [
              GestureDetector(
                child: Container(
                  width: 120.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4.0,
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Textt(size: 25.0, text: 'Logout'),
                  )),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
