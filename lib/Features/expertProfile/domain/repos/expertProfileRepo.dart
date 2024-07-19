import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';


import '../../../../core/errors/failure.dart';

abstract class ExpertProfileRepo {
  Future<Either<Failure, MakeFavoriteEntity>> makeFavorite(
      {required Map<String, dynamic> data,required Map<String, dynamic> headers});

}
