import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';



import '../../../../core/errors/failure.dart';


abstract class FavoriteRepo {
  Future<Either<Failure, List<FavoriteEntity>>> viewFavorite(
      {required Map<String, dynamic> headers});
}
