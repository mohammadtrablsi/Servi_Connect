import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';
import 'package:servi_connect/Features/expertProfile/domain/repos/expertProfileRepo.dart';

import '../../../../core/errors/failure.dart';

import '../dataSources/expertProfileRemoteDataSource.dart';

class ExpertProfileRepoImpl extends ExpertProfileRepo {
  final ExpertProfileRemoteDataSource expertProfileRemoteDataSource;

  ExpertProfileRepoImpl({required this.expertProfileRemoteDataSource});

  @override
  Future<Either<Failure, MakeFavoriteEntity>> makeFavorite(
      {required Map<String, dynamic> data,
      required Map<String, dynamic> headers}) async {
    MakeFavoriteEntity entity;
    try {
      entity = await expertProfileRemoteDataSource.makeFavorite(
          request: data, headers: headers);
      print('1111111111111111111111');
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
