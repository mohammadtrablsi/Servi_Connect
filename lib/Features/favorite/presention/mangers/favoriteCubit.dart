import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';
import 'package:servi_connect/Features/favorite/domain/useCases/favoriteUseCase.dart';









part 'favoriteStates.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteUseCase) : super(FavoriteInitial());

  final FavoriteUseCase favoriteUseCase;
  Future<void> viewFavorite(
      {
      required Map<String, dynamic> headers}) async {
    emit(FavoriteLoading());
    var result = await favoriteUseCase.call( headers);
    result.fold((failure) {
      emit(FavoriteFailure(failure.message));
    }, (Favorites) {
      emit(FavoriteSuccess(Favorites));
    });
  }
}
