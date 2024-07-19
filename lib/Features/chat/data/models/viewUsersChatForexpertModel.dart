import 'package:servi_connect/Features/chat/domain/entites/viewUsersChatForexpertEntity.dart';

class ViewUsersChatForexpertModel extends ViewUsersChatForexpertEntity {
  User? user;
  String? text;
  String? createdAt;

  ViewUsersChatForexpertModel({this.user, this.text, this.createdAt})
      : super(
            firstName: user!.firstName, lastName: user.lastName, id: user.sId);

  factory ViewUsersChatForexpertModel.fromJson(Map<String, dynamic> json) =>
      ViewUsersChatForexpertModel(
          user: json['user'] != null ? new User.fromJson(json['user']) : null,
          text: json['text'],
          createdAt: json['createdAt']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['text'] = this.text;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
