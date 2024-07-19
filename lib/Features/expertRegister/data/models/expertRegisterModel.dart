



import '../../domain/entites/expertRegisterEntity.dart';

class ExpertRegisterModel extends ExpertRegisterEntity {
  String? message;
  String? token;

  ExpertRegisterModel({this.message, this.token}) : super(token: token,message: message);

  factory ExpertRegisterModel.fromJson(Map<String, dynamic> json) => ExpertRegisterModel(
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
