import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/useCases/SocketChatUseCase.dart';

part 'socketChatStates.dart';

class SocketChatCubit extends Cubit<SocketChatState> {
  SocketChatCubit(this.socketChatUseCase) : super(SocketChatInitial());
  


  final SocketChatUseCase socketChatUseCase;
  Future<void> SocketSocketChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    emit(SocketChatLoading());
    var result = await socketChatUseCase.call(headers, data);
    result.fold((failure) {
      emit(SocketChatFailure(failure.message));
    }, (data) {
      emit(SocketChatSuccess());
    });
  }


}
