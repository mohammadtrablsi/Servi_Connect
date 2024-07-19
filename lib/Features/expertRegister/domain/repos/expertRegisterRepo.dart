import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/expertRegisterEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';



abstract class ExpertRegisterRepo {
  Future<Either<Failure, ExpertRegisterEntity>> makeExpertRegister(
      {required FormData data});
  Future<Either<Failure, List<CategoryEntity>>> viewCategory();
}
