
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

import '../entites/expertRegisterEntity.dart';
import '../repos/expertRegisterRepo.dart';


class ExpertRegisterUseCase{
  final ExpertRegisterRepo expertRegisterRepo;

  ExpertRegisterUseCase(this.expertRegisterRepo);


  Future<Either<Failure, ExpertRegisterEntity>> call(
      FormData param ) async {
    return await expertRegisterRepo.makeExpertRegister(data: param);
  }
}
