import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Common%20widgets/searchbar.dart';
import '../Common widgets/sizedboxx.dart';
import '../Common widgets/textt.dart';
import '../Data/NotesData.dart';
import '../Common widgets/notes_tabs.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesScreen extends StatelessWidget {
  final DateFormat _dateFormatter = DateFormat.MMMEd();

  NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(
        16.0,
        8.0,
        16.0,
        8.0,
      ),
      child: Column(
        children: [
          Textt(text: 'Notes', size: 32.0),
          SizedBoxx(
            h: 12.0,
          ),
          SearchBar(),
          SizedBoxx(
            h: 12.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return MySquare(
                    title: notes[index].title,
                    content: notes[index].content,
                    time: _dateFormatter.format(notes[index].date),
                  );
                }),
          ),
        ],
      ),
    )));
  }
}
