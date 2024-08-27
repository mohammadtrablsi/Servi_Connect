import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

class LoginModel extends LoginEntity {
  String? message;
  String? token;
  String? sId;

  LoginModel({this.message, this.token, this.sId})
      : super(token: token, id: sId);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      message: json['message'], token: json['token'], sId: json['id']);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;

    return data;
  }
}
