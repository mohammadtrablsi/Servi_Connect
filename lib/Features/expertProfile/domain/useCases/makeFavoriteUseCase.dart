import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';

import '../../../../core/errors/failure.dart';

import '../repos/expertProfileRepo.dart';

class MakeFavoriteUseCase {
  final ExpertProfileRepo expertProfileRepo;

  MakeFavoriteUseCase(this.expertProfileRepo);

  Future<Either<Failure, MakeFavoriteEntity>> call(
      Map<String, dynamic> param, Map<String, dynamic> headers) async {
    return await expertProfileRepo.makeFavorite(data: param, headers: headers);
  }
}
