
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/taskEntity.dart';
import '../repos/tasksRepo.dart';

class AddToDoUseCase extends UseCase<TaskEntity, Map<String, dynamic>> {
  final TasksRepo tasksRepo;

  AddToDoUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, TaskEntity>> call(
      [Map<String, dynamic> param = const {}]) async {
    return await tasksRepo.addToDo(
      data: param,
    );
  }
}
