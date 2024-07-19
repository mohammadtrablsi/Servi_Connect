
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/taskEntity.dart';
import '../repos/tasksRepo.dart';

class UpdateToDoUseCase extends UseCase<TaskEntity, Map<String, dynamic>> {
  final TasksRepo tasksRepo;

  UpdateToDoUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, TaskEntity>> call(
      [Map<String, dynamic> param = const {}]) async {
    return await tasksRepo.updateToDo(
      data: param,
    );
  }
}
