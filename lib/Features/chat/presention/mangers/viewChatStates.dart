part of 'viewChatCubit.dart';

@immutable
abstract class ViewChatState {}

class ViewChatInitial extends ViewChatState {}

class ViewChatLoading extends ViewChatState {}

class ViewChatFailure extends ViewChatState {
  final String errMessage;

  ViewChatFailure(this.errMessage);
}

class ViewChatSuccess extends ViewChatState {
  final List<ViewChatEntity> ViewChats;

  ViewChatSuccess(this.ViewChats);
}
