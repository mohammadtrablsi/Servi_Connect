import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';

class viewChatModel extends ViewChatEntity {
  String? sId;
  String? user;
  String? expert;
  String? text;
  String? createdAt;
  String? updatedAt;
  int? iV;

  viewChatModel(
      {this.sId,
      this.user,
      this.expert,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.iV})
      : super(text: text, createdAt: createdAt);

  factory viewChatModel.fromJson(Map<String, dynamic> json) => viewChatModel(
      sId: json['_id'],
      user: json['user'],
      expert: json['expert'],
      text: json['text'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['expert'] = this.expert;
    data['text'] = this.text;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
