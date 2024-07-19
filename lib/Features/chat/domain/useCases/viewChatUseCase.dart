import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Chat/domain/repos/ChatRepo.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';




class ViewChatUseCase {
  ViewChatUseCase( {required this.chatRepo});
  ChatRepo chatRepo;


  Future<Either<Failure, List<ViewChatEntity>>> call(
  Map<String, dynamic> headers, Map<String, dynamic> data) async {
    return await chatRepo.viewChat(headers: headers,data:data);
  }
}
