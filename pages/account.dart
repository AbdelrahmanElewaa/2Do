// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Account',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color.fromARGB(255, 12, 34, 51)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/omar.jpg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Settings");
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 60, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
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
                child: Text('Omar mohamed abdel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 12, 34, 51),
                    )),
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
          color: Color.fromARGB(140, 255, 193, 7),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ]),
              Row(children: [
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
                GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Text('Update',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 145, 171))),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
