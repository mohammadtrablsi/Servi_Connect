import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';

class ProfileModel extends ProfileEntity {
  String? message;
  User? user;

  ProfileModel({this.message, this.user})
      : super(
            phone: user!.phone,
            image: user!.profileImage,
            message: message,
            firstName: user!.firstName,
            lastName: user.lastName,
            email: user.email,
            address: user.address,
            experence: user.experence);

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      message: json['message'],
      user: json['user'] != null ? new User.fromJson(json['user']) : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? experence;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? profileImage;
  String? phone;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.experence,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    address = json['address'];
    experence = json['experence'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    profileImage = json['profileImage'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['experence'] = this.experence;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['profileImage'] = this.profileImage;
    return data;
  }
}
