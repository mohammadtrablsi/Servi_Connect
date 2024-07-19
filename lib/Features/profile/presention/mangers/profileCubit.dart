import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';




import 'package:servi_connect/Features/Profile/domain/useCases/profileUseCase.dart';



part 'profileStates.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());

  final ProfileUseCase profileUseCase;
  Future<void> viewProfile(
      {required Map<String, dynamic> data,
      required Map<String, dynamic> headers}) async {
    emit(ProfileLoading());
    var result = await profileUseCase.call(data, headers);
    result.fold((failure) {
      emit(ProfileFailure(failure.message));
    }, (tasks) {
      emit(ProfileSuccess(tasks));
    });
  }
}
