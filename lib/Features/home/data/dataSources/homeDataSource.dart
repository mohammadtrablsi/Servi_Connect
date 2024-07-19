import 'package:servi_connect/Features/home/data/models/AdsModel.dart';
import 'package:servi_connect/Features/home/data/models/categoryModel.dart';
import 'package:servi_connect/Features/home/data/models/expertsByCatModel.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';

import '../../../../core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> viewCategory();
  Future<List<AdsEntity>> viewAds();
  Future<List<ExpertsByCatEntity>> viewExpertsByCat(Map<String,dynamic>headers,Map<String,dynamic>data);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<AdsEntity>> viewAds() async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.get(
        data: {},
        endPoint: 'http://10.0.2.2:8000/api/advertisements',
        headers: {});
    List<AdsEntity> Ads = getAdsList(response);
    // saveHomesData(Homes, kHomesBox);
    return Ads;
  }

  @override
  Future<List<CategoryEntity>> viewCategory() async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.get(
        data: {}, endPoint: 'http://10.0.2.2:8000/api/category', headers: {});
    List<CategoryEntity> categories = getCategoryList(response);
    // saveHomesData(Homes, kHomesBox);
    return categories;
  }

  List<AdsEntity> getAdsList(Map<String, dynamic> data) {
    List<AdsEntity> Ads = [];
    for (var AdsMap in data['ads']) {
      Ads.add(AdsModel.fromJson(AdsMap));
    }
    return Ads;
  }

  List<CategoryEntity> getCategoryList(Map<String, dynamic> data) {
    List<CategoryEntity> categories = [];
    for (var AdsMap in data['categories']) {
      categories.add(CategoryModel.fromJson(AdsMap));
    }
    return categories;
  }



    @override
  Future<List<ExpertsByCatEntity>> viewExpertsByCat(Map<String, dynamic> headers,Map<String, dynamic> data) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.get(
        data: data, endPoint: 'http://10.0.2.2:8000/api/cateExperts', headers: headers);
    List<ExpertsByCatEntity> expertsByCat = getExpertsByCatList(response);
    // saveHomesData(Homes, kHomesBox);
    return expertsByCat;
  }

    List<ExpertsByCatEntity> getExpertsByCatList(Map<String, dynamic> data) {
    List<ExpertsByCatEntity> expertsByCat = [];
    for (var expertsByCatMap in data['data']) {
      expertsByCat.add(ExpertsByCatModel.fromJson(expertsByCatMap));
    }
    return expertsByCat;
  }
}
