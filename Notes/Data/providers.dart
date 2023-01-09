import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Data/tasksRepository.dart';
import '../Domain/notes.dart';
import '../Data/notes_repository.dart';

final notesprovider = StateProvider<List<Pet>>((ref) {
  final notesrep = PetsRepository.instance;
  List<Pet> notess = [];
  notesrep.fetchPetList().then((value) {
    notess = value;
    // print('notess: $notess');
    // return notess;
  });
    print('notess: $notess');
  return notess;

});
// }

