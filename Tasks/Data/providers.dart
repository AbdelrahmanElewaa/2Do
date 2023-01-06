import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/Tasks/Data/TasksData.dart';
import 'package:todo/Tasks/Data/tasksRepository.dart';

// class provider{

final todoprovider = StateProvider<List<Todo>>((ref) {
  final taskrep = TasksRepository.instance;
  List<Todo> todoss = [];
  taskrep.fetchTodoList().then((value) {
    todoss = value;
  });

// if(todoss.length==0){
// taskrep.initTodos().then((value){
// todoss=value;
// });
// }
  // we can also return an empty String here, for the sake of simplicity,
  //  let's return a sample name
  return todoss;
});
// }
