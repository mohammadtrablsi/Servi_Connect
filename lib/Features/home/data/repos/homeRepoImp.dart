import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/home/data/dataSources/homeDataSource.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';
import 'package:servi_connect/Features/home/domain/Repos/homeRepo.dart';





import 'package:servi_connect/core/errors/failure.dart';



class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<AdsEntity>>> viewAds() async {
    List<AdsEntity> entity;
    try {
      entity = await homeRemoteDataSource.viewAds();
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

  @override
  Future<Either<Failure, List<CategoryEntity>>> viewCategory() async {
    List<CategoryEntity> entity;
    try {
      entity = await homeRemoteDataSource.viewCategory();
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

  @override
  Future<Either<Failure, List<ExpertsByCatEntity>>> viewExpertsByCat(Map<String, dynamic> headers,Map<String, dynamic> data) async {
    List<ExpertsByCatEntity> entity;
    try {
      entity = await homeRemoteDataSource.viewExpertsByCat(headers,data);
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
