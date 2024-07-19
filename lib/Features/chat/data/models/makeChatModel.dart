import 'package:servi_connect/Features/chat/domain/entites/makeChatEntity.dart';

class MakeChatModel extends MakeChatEntity {
  String? message;

  MakeChatModel({this.message}) : super(message: message);

  factory MakeChatModel.fromJson(Map<String, dynamic> json) =>
      MakeChatModel(message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
