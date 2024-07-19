import 'package:hive/hive.dart';

import '../../../Features/tasks/domain/entites/taskEntity.dart';

void saveTasksData(List<TaskEntity> tasks, String boxName) {
  var box = Hive.box<TaskEntity>(boxName);
  box.addAll(tasks);
}
