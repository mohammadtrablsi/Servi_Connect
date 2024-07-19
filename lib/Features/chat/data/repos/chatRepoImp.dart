import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Chat/domain/repos/ChatRepo.dart';
import 'package:servi_connect/Features/chat/data/dataSources/chatDataSource.dart';
import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';

import '../../../../core/errors/failure.dart';

class ChatRepoImpl extends ChatRepo {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepoImpl({required this.chatRemoteDataSource});

  @override
  Future<Either<Failure, List<ViewChatEntity>>> viewChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    List<ViewChatEntity> ChatList;
    try {
      // ChatList = ChatLocalDataSource.getAllChats(
      //   pageNumber: page['pageNumber'],
      // );
      // if (ChatList.isNotEmpty) {
      //   return right(ChatList);
      // }
      ChatList =
          await chatRemoteDataSource.viewChat(headers: headers, data: data);
      // print('temooooooooooooooooooooooooooooooooooooo$ChatList');
      return right(ChatList);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MakeChatEntity>> makeChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    MakeChatEntity chat;
    try {
      // ChatList = ChatLocalDataSource.getAllChats(
      //   pageNumber: page['pageNumber'],
      // );
      // if (ChatList.isNotEmpty) {
      //   return right(ChatList);
      // }
      chat = await chatRemoteDataSource.makeChat(headers: headers, data: data);
      // print('temooooooooooooooooooooooooooooooooooooo$ChatList');
      return right(chat);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SocketChatEntity>> socketChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    SocketChatEntity chat;
    try {
      // ChatList = ChatLocalDataSource.getAllChats(
      //   pageNumber: page['pageNumber'],
      // );
      // if (ChatList.isNotEmpty) {
      //   return right(ChatList);
      // }
      chat =
          await chatRemoteDataSource.socketChat(headers: headers, data: data);
      // print('temooooooooooooooooooooooooooooooooooooo$ChatList');
      return right(chat);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ViewUsersChatForexpertEntity>>> viewUsersChatForexpert(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    List<ViewUsersChatForexpertEntity> list;
    try {
      // ChatList = ChatLocalDataSource.getAllChats(
      //   pageNumber: page['pageNumber'],
      // );
      // if (ChatList.isNotEmpty) {
      //   return right(ChatList);
      // }
      list = await chatRemoteDataSource.viewUsersChatForexpert(
          headers: headers, data: data);
      // print('temooooooooooooooooooooooooooooooooooooo$ChatList');
      return right(list);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }
}
