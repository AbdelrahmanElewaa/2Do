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
  Noteslist({super.key});

  @override
  State<Noteslist> createState() => _NoteslistState();
}

class _NoteslistState extends State<Noteslist> {
  final petsRepository = PetsRepository.instance;
  List<Pet> pets = [];
  @override
  void initState() {
    if (globals.sorting == true) {
      petsRepository.fetchPetList().then((value) {
        setState(() {
          pets = value;
        });
      });
    } else {
      petsRepository.fetchPetListAsc().then((value) {
        setState(() {
          pets = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    int? id = pets[index].id;
                    petsRepository.delete(id).then((rowsDeleted) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Note deleted'))));
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
