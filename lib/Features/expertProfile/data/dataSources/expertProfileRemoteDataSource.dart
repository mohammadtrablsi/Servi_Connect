import 'package:servi_connect/Features/expertProfile/data/models/expertProfileModel.dart';
import 'package:servi_connect/Features/expertProfile/data/models/makeFavoriteModel.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/expertProfileEntity.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api_service.dart';

abstract class ExpertProfileRemoteDataSource {
  Future<MakeFavoriteEntity> makeFavorite(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers});
  Future<ExpertProfileEntity> getExpertById(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers});
}

class ExpertProfileRemoteDataSourceImpl extends ExpertProfileRemoteDataSource {
  final ApiService apiService;

  ExpertProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<MakeFavoriteEntity> makeFavorite(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.post(
        data: request,
        endPoint: 'http://10.0.2.2:8000/api/favorite',
        headers: headers);
    MakeFavoriteEntity entity;
    entity = MakeFavoriteModel.fromJson(response);

    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

  @override
  Future<ExpertProfileEntity> getExpertById(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers}) async {
    var response = await apiService.get(
        data: {},
        endPoint: "http://10.0.2.2:8000/api/expert/getProfile",
        headers: {});
    ExpertProfileEntity entity;
    entity = ExpertProfileModel.fromJson(response);
    print("rrrrrrrrrrrrrrrrrrrrrrrrr$response");

    // await prefs.setInt('userId', entity.id);
    //
    return entity;
  }
}
