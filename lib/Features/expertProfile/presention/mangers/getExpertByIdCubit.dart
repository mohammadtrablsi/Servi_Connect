import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:servi_connect/Features/expertProfile/domain/useCases/getExpertById.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/expertProfileEntity.dart';

part 'getExpertByIdStates.dart';

class GetExpertByIdCubit extends Cubit<GetExpertByIdState> {
  GetExpertByIdCubit(this.getExpertByIdUseCase) : super(GetExpertByIdInitial());
  bool isFavorite = false;

  final GetExpertByIdUseCase getExpertByIdUseCase;
  Future<void> getExpertById(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers}) async {
    print("hello");
    emit(GetExpertByIdLoading());
    var result = await getExpertByIdUseCase.call(request, headers);
    result.fold((failure) {
      emit(GetExpertByIdFailure(failure.message));
    }, (tasks) {
      emit(GetExpertByIdSuccess(tasks));
    });
  }

  void GetExpertByIdStyle() {
    isFavorite = !isFavorite;
    emit(GetExpertByIdInitial());
  }
}
