import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';

class FavoriteModel extends FavoriteEntity {
  String? sId;
  String? user;
  Expert? expert;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FavoriteModel(
      {this.sId,
      this.user,
      this.expert,
      this.createdAt,
      this.updatedAt,
      this.iV})
      : super(
          firstName: expert!.firstName,
          lastName: expert.lastName,
          email: expert.email,
          address: expert.address,
          experence: expert.experence
        );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
      sId: json['_id'],
      user: json['user'],
      expert:
          json['expert'] != null ? new Expert.fromJson(json['expert']) : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Expert {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? address;
  String? experence;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Expert(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.address,
      this.experence,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Expert.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    experence = json['experence'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['experence'] = this.experence;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
