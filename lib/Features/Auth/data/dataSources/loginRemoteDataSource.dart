import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Auth/data/models/loginModel.dart';
import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';
import 'package:servi_connect/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api_service.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> makeLogin({required Map<String, dynamic> request});
  Future<LoginEntity> makeUserRegister({required FormData request});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginEntity> makeLogin({required Map<String, dynamic> request}) async {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.post(
        data: request,
        endPoint: 'http://10.0.2.2:8000/api/auth/login',
        headers: {});
    print(response);
    LoginEntity entity;
    entity = LoginModel.fromJson(response);
    await prefs?.setString('token', entity.token ?? "noToken");
    await prefs?.setString('id', entity.id ?? "noId");
    print(prefs?.getString('id'));

    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }

  @override
  Future<LoginEntity> makeUserRegister({required FormData request}) async {
    print('okkkkkkkkkkkkkkkkkkkkkkkkkk$request');
    var response = await apiService.post(
        data: request,
        endPoint: 'http://10.0.2.2:8000/api/auth/register',
        headers: {});
    LoginEntity entity;
    entity = LoginModel.fromJson(response);
    await prefs?.setString('token', entity.token ?? "noToken");
    await prefs?.setString('id', entity.id ?? "noId");
    print(prefs?.getString('id'));

    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return entity;
  }
}
