import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Common%20widgets/searchbar.dart';
import 'package:unicons/unicons.dart';
import '../Common widgets/sizedboxx.dart';
import '../Common widgets/textt.dart';
import '../Data/NotesData.dart';
import '../Common widgets/notes_tabs.dart';
import '../Data/notes_repository.dart';
import '../domain/notes.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DateFormat _dateFormatter = DateFormat.MMMEd();
  final petsRepository = PetsRepository.instance;
  List<Pet> pets = [];
  @override
  void initState() {
    petsRepository.fetchPetList().then((value) {
      setState(() {
        pets = value;
      });
    });
    super.initState();
  }

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
                itemCount: pets.length,
                itemBuilder: (BuildContext context, int index) {
                  return MySquare(
                    title: ' ${pets[index].title}',
                    content: '${pets[index].content}',
                    time: '${pets[index].date}',
                  );
                }),
          ),
          ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).go('/notesdetails');
              },
              icon: Icon(
                UniconsLine.plus_square,
              ),
              label: Text('Add'))
        ],
      ),
    )));
  }
}
