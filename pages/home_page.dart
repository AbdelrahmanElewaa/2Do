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
      backgroundColor: '0C2233'.toColor(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // inde
          // currentIndex: _selectedIndex, //New
          // onTap: _onItemTapped,
          // _selectedIndex
          // currentIndex: _selectedIndex, //New
          // onTap: _onItemTapped,
          BottomNavigationBarItem(
            icon:
                // TextButton(
                // onTap: ,
                // onPressed: () { GoRouter.of(context).go('/addtask'); },
                // child:
                const Icon(color: Colors.black, Icons.home_sharp),
            // ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                // TextButton(
                // onPressed: () { GoRouter.of(context).go('/stat'); },

                // child:
                Icon(color: Colors.black, Icons.calendar_month_rounded),
            // ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(color: Colors.black,Icons.book),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: 'FFC045'.toColor(),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
