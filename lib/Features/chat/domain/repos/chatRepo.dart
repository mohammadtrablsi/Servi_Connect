import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';

import '../../../../core/errors/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<ViewChatEntity>>> viewChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<Either<Failure, MakeChatEntity>> makeChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<Either<Failure, SocketChatEntity>> socketChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<Either<Failure, List<ViewUsersChatForexpertEntity>>>
      viewUsersChatForexpert(
          {required Map<String, dynamic> headers,
          required Map<String, dynamic> data});
}
