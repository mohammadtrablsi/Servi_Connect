import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

import '../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> makeLogin(
      {required Map<String, dynamic> data});
  Future<Either<Failure, LoginEntity>> makeUserRegister(
      {required FormData data});
}
