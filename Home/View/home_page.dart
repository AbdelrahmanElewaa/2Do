// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/Home/View/home.dart';
import 'package:todo/Statistics/View/stat.dart';
import 'package:todo/Home/Widgets/tasks_tile.dart';
import 'package:flutter/material.dart';

import '../../Notes/View/notes_screen.dart';
import '../../Tasks/Domain/TasksModel.dart';
// import 'package:todo/Common%20widgets/colorextension.dart';
// import '../Tasks/Domain/AddTask.dart';
// import '../domain/TasksModel.dart';
// import '../Notes/View/notes_screen.dart';

class HomePage extends StatefulWidget {
  int selectedIndex;
  HomePage({
    required this.selectedIndex,
    // required this.onTodoChanged,
  }) : super(key: ValueKey(selectedIndex));

  @override
  State<HomePage> createState() => _HomePageState(selectedIndex: selectedIndex);
}

class _HomePageState extends State<HomePage> {

  int selectedIndex;
  _HomePageState({
    required this.selectedIndex,
    // required this.onTodoChanged,
  }) : super( );

  // int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    home(),
    Stat(),
    TodoList(),
    NotesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              haptic: true,
              backgroundColor: Colors.transparent,
              color: Theme.of(context).colorScheme.primary,
              activeColor: Theme.of(context).colorScheme.primary,
              tabBackgroundColor: Theme.of(context).colorScheme.secondary,
              gap: 8,
              curve: Curves.easeInSine,
              duration: Duration(milliseconds: 900),
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.calendar_month_rounded, text: 'Calendar'),
                GButton(icon: Icons.checklist_outlined, text: 'Tasks'),
                GButton(icon: Icons.book, text: 'Notes'),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}

