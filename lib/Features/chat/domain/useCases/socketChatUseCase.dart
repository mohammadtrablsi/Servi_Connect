import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Chat/domain/repos/chatRepo.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';
import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';

class SocketChatUseCase {
  SocketChatUseCase({required this.chatRepo});
  ChatRepoImpl chatRepo;

  Future<Either<Failure, SocketChatEntity>> call(
      Map<String, dynamic> headers, Map<String, dynamic> data) async {
    return await chatRepo.socketChat(headers: headers, data: data);
  }
}
