import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/Notes/View/notes_list.dart';
import 'package:todo/consts/theme_data.dart';
import '../Data/notes_repository.dart';
import '../Domain/notes.dart';
import '../Widgets/notes_tabs.dart';

class NotesSearchbar extends StatefulWidget {
  const NotesSearchbar({super.key});

  @override
  State<NotesSearchbar> createState() => _NotesSearchbarState();
}

class _NotesSearchbarState extends State<NotesSearchbar> {
  bool isVisible = true;
  final petsRepository = PetsRepository.instance;
  List<Pet> petsByName = [];
  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                controller: queryController,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                decoration: InputDecoration(
                  // textfield input color
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.primary),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0),
                  ),

                  labelText: 'Search',
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    petsRepository.fetchPetListByName(text).then((value) {
                      setState(() {
                        petsByName = value;
                      });
                    });
                  } else {
                    setState(() {
                      petsByName.clear();
                    });
                  }
                  // else if (text.isEmpty) {
                  //   setState(() {
                  //     isVisible == false;
                  //     print('emptyyyyyyy');
                  //   });
                  // }
                  // print('jhghjgjghghghggghgh  ${petsByName.length}');
                  // if ((petsByName.length) == 0) {
                  //   print('helooooooooooooooo');

                  //   setState(() {
                  //     isVisible == false;
                  //   });
                  // } else {
                  //   print('jhghjgjghghghggghgh  ${petsByName.length}');

                  //   print('mmmmmmmmmmmmmmmmmmmm');

                  //   setState(() {
                  //     isVisible == true;
                  //   });
                  // }
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: petsByName.length,
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
                      int? id = petsByName[index].id;
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

                child: MySquare(
                  title: ' ${petsByName[index].title}',
                  content: '${petsByName[index].content}',
                  time: '${petsByName[index].date}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
