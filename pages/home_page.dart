// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:todo/pages/homw.dart';
import 'package:todo/pages/stat.dart';
import 'package:todo/util/tasks_tile.dart';
import 'package:flutter/material.dart';
import 'package:todo/util/colorextension.dart';

import 'notes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    home(),
    Stat(),
    NotesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
        ListTile(
        leading: const Icon(Icons.person),
        title: const Text(' My Profile '),
        onTap: () {
          GoRouter.of(context).go('/settings');
        },
      ),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
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


      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('LogOut'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(color: Colors.black, Icons.home_sharp),
            // ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.black, Icons.calendar_month_rounded),
            // ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.black, Icons.book),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(140, 255, 193, 7),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
