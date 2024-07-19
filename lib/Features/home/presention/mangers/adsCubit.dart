import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';

import 'package:servi_connect/Features/home/domain/useCases/AdsUseCase.dart';

part 'adsStates.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this.adsUseCase) : super(AdsInitial());

  final AdsUseCase adsUseCase;
  Future<void> viewAds() async {
    emit(AdsLoading());
    var result = await adsUseCase.call();
    result.fold((failure) {
      emit(AdsFailure(failure.message));
    }, (tasks) {
      emit(AdsSuccess(tasks));
    });
  }
}
