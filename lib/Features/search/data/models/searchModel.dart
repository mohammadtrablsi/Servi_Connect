

import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';

class SearchModel extends SearchEntity{
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? experence;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SearchModel(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.experence,
      this.createdAt,
      this.updatedAt,
      this.iV})
      : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            address: address,
            experence: experence);

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        sId: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        address: json['address'],
        experence: json['experence'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        iV: json['__v']
      );

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
    return data;
  }
}
