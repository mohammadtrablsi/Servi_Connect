import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/expertProfileEntity.dart';
import 'package:servi_connect/Features/expertProfile/domain/entites/makeFavoriteEntity.dart';

import '../../../../core/errors/failure.dart';

import '../repos/expertProfileRepo.dart';

class GetExpertByIdUseCase {
  final ExpertProfileRepo expertProfileRepo;

  GetExpertByIdUseCase(this.expertProfileRepo);

  Future<Either<Failure, ExpertProfileEntity>> call(
      Map<String, dynamic> param, Map<String, dynamic> headers) async {
    return await expertProfileRepo.getExpertById(
        request: param, headers: headers);
  }
}
