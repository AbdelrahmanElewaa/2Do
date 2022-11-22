// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/pages/home.dart';
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
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              haptic: true,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade500,
              gap: 8,
              curve: Curves.easeInSine,
              duration: Duration(milliseconds: 900),
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.calendar_month_rounded, text: 'Calendar'),
                 GButton(icon: Icons.book, text: 'Notes'),              
                GButton(icon: Icons.add, text: 'New Task'),
               
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
