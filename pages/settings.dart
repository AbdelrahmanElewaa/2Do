// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: Color.fromARGB(255, 12, 34, 51),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/1024.png'),
                    ),
                  ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('Omar mohamed abdel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 255, 192, 69),
                  ))
            ]),
            Divider(
              height: 50,
              thickness: 1,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/account');
                    },
                    child: ProfileListItem(
                      icon: Icons.account_box_rounded,
                      text: 'Account',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/login');
                    },
                    child: ProfileListItem(
                      icon: Icons.login_rounded,
                      text: 'login',
                    ),
                  ),
                  ProfileListItem(
                    icon: Icons.feedback_outlined,
                    text: 'Feedback',
                  ),
                  ProfileListItem(
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

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  const ProfileListItem({super.key, required this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
            ),
          ]),
        ),
      ),
    );
  }
}

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('AlertDemo with TextField '),
      content: TextField(
        decoration: InputDecoration(hintText: "Enter Text"),
      ),
    );
  }
}
