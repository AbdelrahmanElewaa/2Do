import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Shared/Widgets/textt.dart';
import '../Data/notes_repository.dart';

class NotesDetails extends StatefulWidget {
  final bool update;
  const NotesDetails({super.key, this.update = false});
  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  final petsRepository = PetsRepository.instance;
  final DateFormat _dateFormatter = DateFormat.MMMEd();

  //controllers used in insert/update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
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
                  if (titleController.text.isNotEmpty ||
                      contentController.text.isNotEmpty) {
                    String title = titleController.text;
                    String content = contentController.text;
                    String date = '${_dateFormatter.format(DateTime.now())}';
                    petsRepository.insert(title, content, date).then((id) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Note Added'))));
                  }
                  Navigator.of(context).pop();
                }),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              // ignore: prefer_const_constructors
              TextField(
                controller: titleController,
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ]),
          )),
    );
  }
}
