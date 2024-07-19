
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/profile/data/dataSources/profileDataSource.dart';
import 'package:servi_connect/Features/profile/domain/repos/profileRepo.dart';

import '../../../../core/errors/failure.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';


class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, ProfileEntity>>  viewProfile(
      {required Map<String, dynamic> data,required Map<String, dynamic> headers}) async {
    ProfileEntity entity;
    try {
      entity = await profileRemoteDataSource.viewProfile(request: data,headers:headers);
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

