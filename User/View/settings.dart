// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Widgets/profilelistitem.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // *account photo
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/1024.png'),
                    ),
                  ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              // *account name
              Text('Omar mohamed abdel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 12, 34, 51),
                  ))
            ]),
            Divider(
              height: 50,
              thickness: 1,
            ),
            Expanded(
              child: ListView(
                children: [
                  // *accounts tabs
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/account');
                    },
                    child: ProfileListItemm(
                      icon: Icons.account_box_rounded,
                      text: 'Account',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/login');
                    },
                    child: ProfileListItemm(
                      icon: Icons.login_rounded,
                      text: 'login',
                    ),
                  ),
                  ProfileListItemm(
                    icon: Icons.feedback_outlined,
                    text: 'Feedback',
                  ),
                  ProfileListItemm(
                    icon: Icons.logout_rounded,
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ]);
  }
}

