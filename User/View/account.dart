// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Home/Widgets/account_tile.dart';
import 'package:todo/globals.dart';

import '../../Shared/Widgets/textt.dart';
import '../../Shared/Widgets/iconn.dart';

class Account extends StatefulWidget {
  final name;
  final email;
  final password;
  final date;
  const Account({super.key, this.name, this.email, this.password, this.date});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

 @override
  void initState() {

  FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      // GoRouter.of(context).go('/login');
      context.go('/login');
    } else {
    //  uid= user.uid;
      print('User is signed in!');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //* back button to Account
        title: Textt(text: 'Account', size: 25.0),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Iconn(icN: Icons.arrow_back_ios_new),
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
                  Container(

                    child: Image.network(currUser!.profileURL, width: 50)
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
                      child: Iconn(
                        icN: Icons.mode_edit_outline,
                        sizee: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Textt(
                  text: currUser!.name,
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ProfileListItem(
                  header: 'Name',
                  text: currUser!.name,
                ),
                ProfileListItem(
                  header: 'Email',
                  text: currUser!.email,
                ),
                ProfileListItem(
                  header: 'Password',
                  text: currUser!.pw,
                ),
                ProfileListItem(
                  header: 'Date of birth',
                  text: currUser!.mobile,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
