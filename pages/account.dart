// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/Common%20widgets/account_tile.dart';

import '../Common widgets/sizedboxx.dart';
import '../Common widgets/textt.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //* back button to Account
        title: Textt(text: 'Account', size: 25.0),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(
                children: [
                  //* Avatar + edit button
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/1024.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Settings");
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 60, 0, 0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.mode_edit_outline,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Textt(
                  text: 'Omar mohamed abdel',
                  size: 20.0,
                ),
              )
            ]),
          ),
          // ignore: prefer_const_literals_to_create_immutables

          Divider(
            height: 50,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              //* tiles containing account info
              children: [
                ProfileListItem(
                  header: 'Name',
                  text: 'Omar mohamed',
                ),
                ProfileListItem(
                  header: 'Username',
                  text: '@Omarr',
                ),
                ProfileListItem(
                  header: 'Password',
                  text: 'sdahsdbasj',
                ),
                ProfileListItem(
                  header: 'Mobile Number',
                  text: '01287121314',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
