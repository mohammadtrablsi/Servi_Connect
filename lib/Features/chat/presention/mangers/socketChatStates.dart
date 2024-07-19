part of 'socketChatCubit.dart';

@immutable
abstract class SocketChatState {}

class SocketChatInitial extends SocketChatState {}

class SocketChatLoading extends SocketChatState {}

class SocketChatFailure extends SocketChatState {
  final String errMessage;

  SocketChatFailure(this.errMessage);
}

class SocketChatSuccess extends SocketChatState {

}
