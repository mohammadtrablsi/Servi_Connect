import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../domain/entites/taskEntity.dart';

abstract class TasksLocalDataSource {
  List<TaskEntity> getAllTasks({int pageNumber = 0});
}

class TasksLocalDataSourceImpl extends TasksLocalDataSource {
  @override
  List<TaskEntity> getAllTasks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<TaskEntity>(kTasksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
