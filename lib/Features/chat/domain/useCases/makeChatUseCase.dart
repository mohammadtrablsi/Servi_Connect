import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Chat/domain/repos/ChatRepo.dart';
import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';





class MakeChatUseCase {
  MakeChatUseCase( {required this.chatRepo});
  ChatRepo chatRepo;


   Future<Either<Failure, MakeChatEntity>> call(
  Map<String, dynamic> headers, Map<String, dynamic> data) async {
    return await chatRepo.makeChat(headers: headers,data:data);
  }
}
