

import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

class LoginModel extends LoginEntity {
  String? message;
  String? token;

  LoginModel({this.message, this.token}) : super(token: token);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json['message'],
        token: json['token'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
