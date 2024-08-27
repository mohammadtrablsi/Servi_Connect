import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/useCases/viewChatUseCase.dart';
import 'package:servi_connect/main.dart';

part 'viewChatStates.dart';

class ViewChatCubit extends Cubit<ViewChatState> {
  ViewChatCubit(this.viewChatUseCase) : super(ViewChatInitial());
  List<ViewChatEntity>? messages;
  TextEditingController chatController = TextEditingController();

  final ViewChatUseCase viewChatUseCase;
  Future<void> viewViewChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    emit(ViewChatLoading());
    var result = await viewChatUseCase.call(headers, data);
    result.fold((failure) {
      emit(ViewChatFailure(failure.message));
    }, (ViewChats) {
      emit(ViewChatSuccess(ViewChats));
    });
  }

  void addMessageToScreen() {
    ViewChatEntity viewChatEntity =
        ViewChatEntity(text: chatController.text, createdAt: 'createdAt', user: null, expert: null, sender: prefs?.getString('id'));
    messages!.add(viewChatEntity);

    emit(ViewChatSuccess(messages!));
    
  }

  void setRealTimeData(value) {
    ViewChatEntity viewChatEntity =
        ViewChatEntity(text: value['text'], createdAt: 'createdAt', user: null, expert: null, sender: prefs?.getString('id'));
    messages!.add(viewChatEntity);
    emit(ViewChatSuccess(messages!));
  }
}
