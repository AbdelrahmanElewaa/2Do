import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import '../Domain/notes.dart';
import '../Widgets/notes_tabs.dart';
import '../Data/notes_repository.dart';
import 'notes_list.dart';
import 'notes_searchbar.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: Textt(text: 'Notes', size: 32.0),
              )),
              IconButton(
                splashRadius: 20.0,
                icon: Icon(
                  UniconsLine.plus,
                ),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  GoRouter.of(context).go('/notesadd');
                },
              ),
            ],
          ),
          SizedBoxx(
            h: 12.0,
          ),
          NotesSearchbar(),
          SizedBoxx(
            h: 12.0,
          ),
          Noteslist(),
        ],
      ),
    )));
  }
}
