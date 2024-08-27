import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';

class ExpertsByCatModel extends ExpertsByCatEntity {
  String? sId;
  Expert? expert;
  List<String>? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ExpertsByCatModel(
      {this.sId,
      this.expert,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV})
      : super(
            idOfExpert:expert!.sId,
            image: expert!.profileImage,
            firstName: expert!.firstName,
            lastName: expert.lastName,
            email: expert.email,
            address: expert.address,
            experence: expert.experence,
            category: expert.category);

  factory ExpertsByCatModel.fromJson(Map<String, dynamic> json) =>
      ExpertsByCatModel(
          sId: json['_id'],
          expert: json['expert'] != null
              ? new Expert.fromJson(json['expert'])
              : null,
          category: json['category'].cast<String>(),
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          iV: json['__v']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    data['category'] = this.category;
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
  List<String>? category;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? profileImage;

  Expert(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.address,
      this.experence,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.profileImage});

  Expert.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    experence = json['experence'];
    category = json['category'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    profileImage = json['profileImage'];
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
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
