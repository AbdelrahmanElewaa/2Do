import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Data/tasksRepository.dart';
import '../Domain/notes.dart';
import '../Data/notes_repository.dart';

final notesprovider = StateProvider<List<Note>>((ref) {
  final notesrep = NotesRepository.instance;
  List<Note> notess = [];
  notesrep.fetchNoteList().then((value) {
    notess = value;
    // print('notess: $notess');
    // return notess;
  });
    print('notess: $notess');
  return notess;

});
// }

