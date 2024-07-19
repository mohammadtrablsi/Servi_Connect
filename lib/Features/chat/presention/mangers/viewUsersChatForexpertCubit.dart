import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';
import 'package:servi_connect/Features/chat/domain/useCases/viewUsersChatForexpertUseCase.dart';


part 'viewUsersChatForexpertStates.dart';

class ViewUsersChatForexpertCubit extends Cubit<ViewUsersChatForexpertState> {
  ViewUsersChatForexpertCubit(this.viewUsersChatForexpertUseCase) : super(ViewUsersChatForexpertInitial());
  List<ViewUsersChatForexpertEntity>? messages;
  TextEditingController chatController = TextEditingController();

  final ViewUsersChatForexpertUseCase viewUsersChatForexpertUseCase;
  Future<void> viewViewUsersChatForexpert(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    emit(ViewUsersChatForexpertLoading());
    var result = await viewUsersChatForexpertUseCase.call(headers, data);
    result.fold((failure) {
      emit(ViewUsersChatForexpertFailure(failure.message));
    }, (viewUsersChatForexperts) {
      emit(ViewUsersChatForexpertSuccess(viewUsersChatForexperts));
    });
  }
}
