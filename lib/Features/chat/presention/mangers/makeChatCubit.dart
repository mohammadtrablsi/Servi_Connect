import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/useCases/MakeChatUseCase.dart';

part 'makeChatStates.dart';

class MakeChatCubit extends Cubit<MakeChatState> {
  MakeChatCubit(this.makeChatUseCase) : super(MakeChatInitial());
  


  final MakeChatUseCase makeChatUseCase;
  Future<void> MakeMakeChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    emit(MakeChatLoading());
    var result = await makeChatUseCase.call(headers, data);
    result.fold((failure) {
      emit(MakeChatFailure(failure.message));
    }, (MakeChats) {
      emit(MakeChatSuccess(MakeChats));
    });
  }


}
