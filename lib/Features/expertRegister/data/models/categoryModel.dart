

import '../../../expertRegister/domain/entites/categoryEntity.dart';

class CategoryModel extends CategoryEntity{
  String? sId;
  String? name;
  int? iV;

  CategoryModel({this.sId, this.name, this.iV}) : super(name: name, id: sId);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(sId: json['_id'], name: json['name'], iV: json['__v']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}
