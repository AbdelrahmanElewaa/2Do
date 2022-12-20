import 'package:hive/hive.dart';

import 'TasksData.dart';
part 'TaskDataHive.g.dart';

@HiveType(typeId: 0)
class TodoHive extends HiveObject {

  @HiveField(0)
  List<Todo> tods;


  TodoHive({required this.tods});
}