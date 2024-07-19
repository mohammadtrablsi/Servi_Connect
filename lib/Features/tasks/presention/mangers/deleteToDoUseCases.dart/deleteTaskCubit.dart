import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import '../../../domain/useCases/deleteToDoUseCases.dart';

part 'deleteTaskStates.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.deleteToDoUseCase) : super(DeleteTaskInitial());

  final DeleteToDoUseCase deleteToDoUseCase;
  Future<void> deleteToDo(int id, BuildContext context) async {
    mangeStateOfPostData(id);
  }

  Future<void> mangeStateOfPostData(int id) async {
    var result = await deleteToDoUseCase.call(id);
    print('resulttttttttttttttttttttttttttttttttttttttttt$result');
    result.fold((failure) {
      emit(DeleteTaskFailure(failure.message));
    }, (_) {
      emit(DeleteTaskSuccess());
    });
  }
}
