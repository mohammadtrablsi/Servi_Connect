import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:servi_connect/Features/home/domain/useCases/CategoryUseCase.dart';

import '../../domain/entites/categoryEntity.dart';

part 'categoryStates.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());
  int numberOfPressed = 0;
  List<CategoryEntity>? data;
  String? idOfPressed;

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

  void setNumberAndIdOfPressed(int value, String id) {
    numberOfPressed = value;
    idOfPressed = id;
    print(id);
    emit(CategoryChange());
  }
}
