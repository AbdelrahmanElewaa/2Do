import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/Data/TasksData.dart';


// class provider{


  final todoprovider=StateProvider<List<Todo>>((ref) {

    // we can also return an empty String here, for the sake of simplicity,
    //  let's return a sample name
    return todos;
  });
// }

