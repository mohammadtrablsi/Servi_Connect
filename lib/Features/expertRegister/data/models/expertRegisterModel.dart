import '../../domain/entites/expertRegisterEntity.dart';

class ExpertRegisterModel extends ExpertRegisterEntity {
  String? message;
  String? token;
  String? id;

  ExpertRegisterModel({this.message, this.token, this.id})
      : super(token: token, message: message, id: id);

  factory ExpertRegisterModel.fromJson(Map<String, dynamic> json) =>
      ExpertRegisterModel(
        message: json['message'],
        token: json['token'],
        id: json['id'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
