import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Shared/Widgets/textt.dart';
import '../Data/notes_repository.dart';
import '../Domain/notes.dart';
import 'package:go_router/go_router.dart';

class NotesDetails extends StatefulWidget {
  final bool update;
  final content;
  final title;
  final id;

  const NotesDetails(
      {super.key,
      this.update = false,
      required this.title,
      required this.content,
      required this.id});
  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  final notesRepository = NotesRepository.instance;
  final DateFormat _dateFormatter = DateFormat.MMMEd();

  //controllers used in insert/update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.title;
    contentController.text = widget.content;
    idUpdateController.text = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            //* back button to notes
            title: Textt(text: 'Notes', size: 25.0),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              splashRadius: 20.0,
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                if (titleController.text != widget.title ||
                    contentController.text != widget.content) {
                  if (titleController.text.isNotEmpty &&
                      contentController.text.isNotEmpty) {
                    Note note = Note(
                        id: int.parse(idUpdateController.text),
                        title: titleController.text,
                        content: contentController.text,
                        date: '${_dateFormatter.format(DateTime.now())}');
                    notesRepository.update(note).then((rowsAffected) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('$rowsAffected rows updated'))));
                  }
                  context.goNamed(
                    "home",
                    params: {"selectedIndex": "3"},
                  );
                }
                ;
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                // Text('${widget.title}'),
                // ignore_for_file: prefer_const_constructors
                TextField(
                  controller: titleController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary,
                      decorationThickness: 0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: contentController,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decorationThickness: 0),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
