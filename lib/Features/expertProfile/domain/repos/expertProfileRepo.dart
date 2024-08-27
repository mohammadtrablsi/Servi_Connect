import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/expertProfileEntity.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';

import '../../../../core/errors/failure.dart';

abstract class ExpertProfileRepo {
  Future<Either<Failure, MakeFavoriteEntity>> makeFavorite(
      {required Map<String, dynamic> data,
      required Map<String, dynamic> headers});
  Future<Either<Failure, ExpertProfileEntity>> getExpertById(
      {required Map<String, dynamic> request,
      required Map<String, dynamic> headers});
}
