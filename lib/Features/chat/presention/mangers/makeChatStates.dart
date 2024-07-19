part of 'makeChatCubit.dart';

@immutable
abstract class MakeChatState {}

class MakeChatInitial extends MakeChatState {}

class MakeChatLoading extends MakeChatState {}

class MakeChatFailure extends MakeChatState {
  final String errMessage;

  MakeChatFailure(this.errMessage);
}

class MakeChatSuccess extends MakeChatState {
  final MakeChatEntity MakeChats;

  MakeChatSuccess(this.MakeChats);
}
