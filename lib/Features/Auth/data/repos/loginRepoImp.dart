import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repos/loginRepo.dart';
import '../dataSources/loginRemoteDataSource.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> makeLogin(
      {required Map<String, dynamic> data}) async {
    LoginEntity entity;
    try {
      entity = await loginRemoteDataSource.makeLogin(request: data);
      print('1111111111111111111111');
      return right(entity);
    } catch (e) {
      if (e is DioException) {
        print(e.message);
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> makeUserRegister(
      {required FormData data}) async {
    LoginEntity entity;
    try {
      entity = await loginRemoteDataSource.makeUserRegister(request: data);
      print('1111111111111111111111');
      return right(entity);
    } catch (e) {
      if (e is DioException) {
        print('2222222222222222222222222222222222');
        print(ServerFailure.fromDioError(e));
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }
}
