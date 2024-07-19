import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api_service.dart';

import '../models/ProfileModel.dart';


abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> viewProfile({required Map<String, dynamic> request,required Map<String, dynamic> headers});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProfileEntity> viewProfile({required Map<String, dynamic> request,required Map<String, dynamic> headers}) async {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.get(
        data: request, endPoint: 'http://10.0.2.2:8000/api/users', headers: headers);
    ProfileEntity entity;
    entity = ProfileModel.fromJson(response);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

}
