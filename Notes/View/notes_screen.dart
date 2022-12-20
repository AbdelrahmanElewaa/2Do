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
                  GoRouter.of(context).go('/notesdetails');
                },
              ),
            ],
          ),
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
                  return Slidable(
                    key: const ValueKey(0),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const StretchMotion(),

                      // A pane can dismiss the Slidable.
                      dismissible: DismissiblePane(
                        onDismissed: () {
                          int? id = pets[index].id;
                          petsRepository.delete(id).then((rowsDeleted) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Note deleted'))));
                        },
                      ),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
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

                    // The end action pane is the one at the right or the bottom side.
                    // endActionPane: ActionPane(
                    //   motion: ScrollMotion(),
                    //   children: [
                    //     SlidableAction(
                    //       // An action can be bigger than the others.

                    //       onPressed: (BuildContext context) {},
                    //       backgroundColor: Color(0xFF7BC043),
                    //       foregroundColor: Colors.white,
                    //       icon: Icons.archive,
                    //       label: 'Archive',
                    //     ),
                    //     SlidableAction(
                    //       borderRadius: BorderRadius.only(
                    //           topRight: Radius.circular(15),
                    //           bottomRight: Radius.circular(15)),
                    //       onPressed: (BuildContext context) {},
                    //       backgroundColor: Color(0xFF0392CF),
                    //       foregroundColor: Colors.white,
                    //       icon: Icons.save,
                    //       label: 'Save',
                    //     ),
                    //   ],
                    // ),
                    child: MySquare(
                      title: ' ${pets[index].title}',
                      content: '${pets[index].content}',
                      time: '${pets[index].date}',
                    ),
                  );
                }),
          ),
        ],
      ),
    )));
  }
}
