import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryEntity>>> viewCategory();
  Future<Either<Failure, List<AdsEntity>>> viewAds();
  Future<Either<Failure, List<ExpertsByCatEntity>>> viewExpertsByCat(Map<String,dynamic>headers,Map<String,dynamic>data);
}
