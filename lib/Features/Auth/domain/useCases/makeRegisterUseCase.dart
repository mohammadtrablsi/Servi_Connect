import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Auth/domain/entites/loginEntity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

import '../repos/loginRepo.dart';

class LoginUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginEntity>> call(
      [Map<String, dynamic> param = const {}]) async {
    return await loginRepo.makeLogin(data: param);
  }
}
