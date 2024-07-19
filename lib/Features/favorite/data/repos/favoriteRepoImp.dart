
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/Favorite/data/dataSources/FavoriteDataSource.dart';
import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';
import 'package:servi_connect/Features/favorite/domain/repos/favoriteRepo.dart';

import '../../../../core/errors/failure.dart';



class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteRemoteDataSource});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> viewFavorite(
      {required Map<String, dynamic> headers}) async {
    List<FavoriteEntity> favoriteList;
    try {
      // FavoriteList = FavoriteLocalDataSource.getAllFavorites(
      //   pageNumber: page['pageNumber'],
      // );
      // if (FavoriteList.isNotEmpty) {
      //   return right(FavoriteList);
      // }
      favoriteList = await favoriteRemoteDataSource.viewFavorite(headers:headers);
      // print('temooooooooooooooooooooooooooooooooooooo$FavoriteList');
      return right(favoriteList);
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

