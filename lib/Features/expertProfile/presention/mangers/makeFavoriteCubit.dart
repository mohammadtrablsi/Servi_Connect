import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';

import 'package:servi_connect/Features/expertProfile/domain/useCases/makeFavoriteUseCase.dart';

part 'makeFavoriteStates.dart';

class MakeFavoriteCubit extends Cubit<MakeFavoriteState> {
  MakeFavoriteCubit(this.makeFavoriteUseCase) : super(MakeFavoriteInitial());
  bool isFavorite = false;
  

  final MakeFavoriteUseCase makeFavoriteUseCase;
  Future<void> makeFavorite(
      {required Map<String, dynamic> data,
      required Map<String, dynamic> headers}) async {
    emit(MakeFavoriteLoading());
    var result = await makeFavoriteUseCase.call(data, headers);
    result.fold((failure) {
      emit(MakeFavoriteFailure(failure.message));
    }, (tasks) {
      emit(MakeFavoriteSuccess(tasks));
    });
  }

  void makeFavoriteStyle() {
    isFavorite = !isFavorite;
    emit(MakeFavoriteInitial());
  }
}
