import 'package:servi_connect/Features/chat/domain/entites/socketChatEntity.dart';

class SocketChatModel extends SocketChatEntity {
  bool? success;
  String? message;

  SocketChatModel({this.success, this.message})
      : super(success: success, message: message);

  factory SocketChatModel.fromJson(Map<String, dynamic> json) =>
      SocketChatModel(success: json['success'], message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
