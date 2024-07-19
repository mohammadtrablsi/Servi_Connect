import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';

import 'package:servi_connect/Features/expertRegister/domain/useCases/CategoryUseCase.dart';



part 'categoryStates.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());

  final CategoryUseCase categoryUseCase;
  Future<void> viewCategory() async {
    emit(CategoryLoading());
    var result = await categoryUseCase.call();
    result.fold((failure) {
      emit(CategoryFailure(failure.message));
    }, (categories) {
      emit(CategorySuccess(categories));
    });
  }
}
