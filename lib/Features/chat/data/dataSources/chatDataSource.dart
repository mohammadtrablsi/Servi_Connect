import 'package:servi_connect/Features/chat/data/models/makeChatModel.dart';
import 'package:servi_connect/Features/chat/data/models/socketChatModel.dart';
import 'package:servi_connect/Features/chat/data/models/viewChatModel.dart';
import 'package:servi_connect/Features/chat/data/models/viewUsersChatForexpertModel.dart';
import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';

import '../../../../core/utils/api_service.dart';

abstract class ChatRemoteDataSource {
  Future<List<ViewChatEntity>> viewChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<MakeChatEntity> makeChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<SocketChatEntity> socketChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
  Future<List<ViewUsersChatForexpertEntity>> viewUsersChatForexpert(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
}

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final ApiService apiService;

  ChatRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ViewChatEntity>> viewChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.get(
        data: data,
        endPoint: 'http://10.0.2.2:8000/api/message',
        headers: headers);
    // ChatEntity entity;
    // entity = ChatModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ViewChatEntity> Chats = getChatsList(response);
    // saveChatsData(Chats, kChatsBox);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return Chats;
  }

  List<ViewChatEntity> getChatsList(Map<String, dynamic> data) {
    List<ViewChatEntity> Chats = [];
    for (var ChatMap in data['messages']) {
      Chats.add(viewChatModel.fromJson(ChatMap));
    }
    return Chats;
  }

  @override
  Future<MakeChatEntity> makeChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.post(
        data: data,
        endPoint: 'http://10.0.2.2:8000/api/message',
        headers: headers);
    // ChatEntity entity;
    // entity = ChatModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    MakeChatEntity entity;
    entity = MakeChatModel.fromJson(response);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

  @override
  Future<SocketChatEntity> socketChat(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.post(
        data: data,
        endPoint: 'http://10.0.2.2:3500/api/socket',
        headers: headers);
    // ChatEntity entity;
    // entity = ChatModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    SocketChatEntity entity;
    entity = SocketChatModel.fromJson(response);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

  @override
  Future<List<ViewUsersChatForexpertEntity>> viewUsersChatForexpert(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.get(
        data: data,
        endPoint: 'http://10.0.2.2:8000/api/message/getUsers',
        headers: headers);
    // ChatEntity entity;
    // entity = ChatModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ViewUsersChatForexpertEntity> users =
        getUsersChatForexpertList(response);
    // saveChatsData(Chats, kChatsBox);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return users;
  }

  List<ViewUsersChatForexpertEntity> getUsersChatForexpertList(
      Map<String, dynamic> data) {
    List<ViewUsersChatForexpertEntity> users = [];
    for (var usersMap in data['messages']) {
      users.add(ViewUsersChatForexpertModel.fromJson(usersMap));
    }
    return users;
  }
}
