// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import '../Data/notes_repository.dart';
import '../Domain/notes.dart';
import '../Widgets/notes_tabs.dart';
import '../../../globals.dart' as globals;
import 'notes_searchbar.dart';

class Noteslist extends StatefulWidget {
  final bool? st;
  Noteslist({super.key, this.st});

  @override
  State<Noteslist> createState() => _NoteslistState();
}

class _NoteslistState extends State<Noteslist> {
  final petsRepository = NotesRepository.instance;
  List<Note> pets = [];
  @override
  void initState() {
    if (globals.sorting == true) {
      petsRepository.fetchNoteList().then((value) {
        setState(() {
          pets = value;
        });
      });
    }
    else {
      petsRepository.fetchNoteListAsc().then((value) {
        setState(() {
          pets = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     if (widget.st == true) {
      petsRepository.fetchNoteList().then((value) {
        setState(() {
          pets = value;
        });
      });
    }
    return Expanded(
      child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: Key(pets[index].id.toString()),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    int? id = pets[index].id;
                    petsRepository.delete(id);
                    pets.removeAt(index);
                    // .then((rowsDeleted) =>
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('Note deleted'))));
                  },
                ),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    onPressed: (BuildContext context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: MySquare(
                id: '${pets[index].id}',
                title: ' ${pets[index].title}',
                content: '${pets[index].content}',
                time: '${pets[index].date}',
              ),
            );
          }),
    );
  }
}
