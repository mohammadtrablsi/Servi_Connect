import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';

import '../../data/repos/FavoriteRepoImp.dart';


class FavoriteUseCase {
  FavoriteUseCase( {required this.favoriteRepo});
  FavoriteRepoImpl favoriteRepo;


  Future<Either<Failure, List<FavoriteEntity>>> call(
  Map<String, dynamic> headers) async {
    return await favoriteRepo.viewFavorite(headers: headers);
  }
}
