
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';

class MakeFavoriteModel extends MakeFavoriteEntity {
  String? message;

  MakeFavoriteModel({this.message}) : super(message: message);

  factory MakeFavoriteModel.fromJson(Map<String, dynamic> json) =>
      MakeFavoriteModel(message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
