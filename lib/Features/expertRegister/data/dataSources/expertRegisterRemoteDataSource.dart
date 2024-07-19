import 'package:dio/dio.dart';
import 'package:servi_connect/Features/expertRegister/data/models/categoryModel.dart';
import 'package:servi_connect/Features/expertRegister/data/models/expertRegisterModel.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/expertRegisterEntity.dart';
import 'package:servi_connect/core/utils/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract class ExpertRegisterRemoteDataSource {
  Future<ExpertRegisterEntity> makeExpertRegister(
      {required FormData request});
  Future<List<CategoryEntity>> viewCategory();
}

class ExpertRegisterRemoteDataSourceImpl
    extends ExpertRegisterRemoteDataSource {
  final ApiService apiService;

  ExpertRegisterRemoteDataSourceImpl(this.apiService);

  @override
  Future<ExpertRegisterEntity> makeExpertRegister(
      {required FormData request}) async {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.post(
        data: request,
        endPoint: 'http://10.0.2.2:8000/api/expert',
        headers: {});
    ExpertRegisterEntity entity;
    entity = ExpertRegisterModel.fromJson(response);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

  @override
  Future<List<CategoryEntity>> viewCategory() async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.get(
        data: {}, endPoint: 'http://10.0.2.2:8000/api/category', headers: {});
    List<CategoryEntity> categories = getCategoryList(response);
    // saveexpertRegistersData(expertRegisters, kexpertRegistersBox);
    return categories;
  }

  List<CategoryEntity> getCategoryList(Map<String, dynamic> data) {
    List<CategoryEntity> categories = [];
    for (var AdsMap in data['categories']) {
      categories.add(CategoryModel.fromJson(AdsMap));
    }
    return categories;
  }
}
