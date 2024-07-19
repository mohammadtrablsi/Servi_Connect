import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/expertRegister/data/dataSources/expertRegisterRemoteDataSource.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/expertRegisterEntity.dart';
import 'package:servi_connect/Features/expertRegister/domain/repos/expertRegisterRepo.dart';
import 'package:servi_connect/core/errors/failure.dart';

class ExpertRegisterRepoImpl extends ExpertRegisterRepo {
  final ExpertRegisterRemoteDataSource expertRegisterRemoteDataSource;

  ExpertRegisterRepoImpl({required this.expertRegisterRemoteDataSource});

  @override
  Future<Either<Failure, ExpertRegisterEntity>> makeExpertRegister(
      {required FormData data}) async {
    ExpertRegisterEntity entity;
    try {
      entity = await expertRegisterRemoteDataSource.makeExpertRegister(
          request: data);
      print(entity.token);
      return right(entity);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure.fromDioError(e));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> viewCategory() async {
    List<CategoryEntity> entity;
    try {
      entity = await expertRegisterRemoteDataSource.viewCategory();
      // print(entity.token);
      return right(entity);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }
}
