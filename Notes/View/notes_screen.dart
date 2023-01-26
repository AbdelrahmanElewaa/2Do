// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Home/View/home_page.dart';
import 'package:todo/NotesShared/Data/shared_notes_repository.dart';
import 'package:unicons/unicons.dart';
import '../../NotesShared/Domain/shared_notes.dart';
import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import '../../TasksShared/Data/tasksFirestore.dart';
import '../../globals.dart';
import '../Domain/notes.dart';
import '../Widgets/notes_tabs.dart';
import '../Data/notes_repository.dart';
import '../../../globals.dart' as globals;
import 'notes_list.dart';
import 'notes_searchbar.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String uid = ' ';
  bool stream = false;

  final notesRepository = NotesRepository.instance;
  List<Note> notes = [];
  @override
  void initState() {
    notesRepository.fetchNoteList().then((value) {
      setState(() {
        notes = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              8.0,
              16.0,
              8.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6, child: Textt(text: 'Notes', size: 32.0)),
                      Expanded(
                        child: IconButton(
                          splashRadius: 20.0,
                          icon: Icon(
                            UniconsLine.cloud_download,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            WidgetsFlutterBinding.ensureInitialized();
                            FirebaseAuth.instance
                                .idTokenChanges()
                                .listen((User? user) {
                              if (user == null) {
                                print('User is currently signed out!');
                                setState(() {
                                  stream = false;
                                });
                                // GoRouter.of(context).go('/login');
                                context.go('/login');
                              }
                              else{
                                // currUser==null? context.go('/login'):  stream = true;;
                                setState(() {
                                  stream = true;
                                });
                              }

                            });
                          },
                        ),
                      ),
                      stream
                          ? StreamBuilder<List<SharedNote>>(
                              stream: readNotes(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print('snapshot.hasData');
                                  final List<SharedNote> notes = snapshot.data!;
                                  Future.delayed(Duration.zero, () async {
                                    for (SharedNote n in notes) {
                                      notesRepository.insertWithid(
                                          int.parse(n.id!),
                                          n.title,
                                          n.content,
                                          n.date);
                                    }
                                  });

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext context) =>
                                  //             HomePage(
                                  //               selectedIndex: 3,
                                  //             )));

                                  return Text('');
                                } else if (snapshot.hasError) {
                                 errorDialog(context,
                                      "Error: Please check your internet connection");
                                  return Text(snapshot.error.toString());
                                } else {
                                  print('no data');
                                  return Text("");
                                }
                              },
                            )
                          : Text(''),
                          
                      Expanded(
                        
                        child: IconButton(
                          splashRadius: 20.0,
                          icon: Icon(
                            UniconsLine.cloud_upload,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            WidgetsFlutterBinding.ensureInitialized();
                            currUser==null? context.go('/login'): context.go('/sharedtasks');
                            FirebaseAuth.instance
                                .idTokenChanges()
                                .listen((User? user) {
                              if (user == null) {
                                print('User is currently signed out!');
                                context.go('/login');
                              } else {
                                setState(() {
                                  for (Note n in notes) {
                                    createNotes(
                                        id: n.id.toString(),
                                        title: n.title,
                                        content: n.content,
                                        date: n.date);
                                  }
                                });
                                print('User is signed in!');
                              }
                            });
                          },
                        ),
                      ),
                      //* sorting button
                      Expanded(
                        child: IconButton(
                          splashRadius: 20.0,
                          icon: Icon(
                            UniconsLine.exchange_alt,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            if (globals.sorting == true) {
                              globals.sorting = false;
                            } else {
                              globals.sorting = true;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => HomePage(
                                          selectedIndex: 3,
                                        )));
                          },
                        ),
                      ),
                      //* add button
                      Expanded(
                        child: IconButton(
                          splashRadius: 20.0,
                          icon: Icon(
                            UniconsLine.plus,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            GoRouter.of(context).go('/notesadd');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxx(
                  h: 12.0,
                ),
                //* search bar
                NotesSearchbar(),
                SizedBoxx(
                  h: 12.0,
                ),
                //* notes list
                Noteslist(st: stream),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
 void errorDialog(BuildContext context, String error) => showDialog(
      context: context,
      // context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });