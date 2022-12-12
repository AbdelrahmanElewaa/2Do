import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Common%20widgets/searchbar.dart';

import '../Common widgets/drawerr.dart';
import '../Common widgets/notes_tile.dart';

import '../Common widgets/notes_searchbar.dart';
import '../Common widgets/sizedboxx.dart';
import '../Common widgets/textt.dart';
import '../Data/NotesData.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBoxx(
                h: 20.0,
              ),
              Textt(text: 'Notes', size: 34.0),
              SizedBoxx(
                h: 16.0,
              ),
              SearchBar()
            ],
          ),
        ),
      ),
    ));
  }
}
