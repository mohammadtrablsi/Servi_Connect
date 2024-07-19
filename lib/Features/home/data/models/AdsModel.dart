import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';

class AdsModel extends AdsEntity {
  String? sId;
  String? path;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AdsModel({this.sId, this.path, this.createdAt, this.updatedAt, this.iV})
      : super(path: path);

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
      sId: json['_id'],
      path: json['path'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['path'] = this.path;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
