
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

import '../repos/loginRepo.dart';

class MakeUserRegisterUseCase {
  final LoginRepo loginRepo;

  MakeUserRegisterUseCase(this.loginRepo);


  Future<Either<Failure, LoginEntity>> call(
      FormData param ) async {
    return await loginRepo.makeUserRegister(data: param);
  }
}
