import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/home/data/repos/homeRepoImp.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';


class ExpertsByCatUseCase {
  ExpertsByCatUseCase({required this.homeRepo});
  HomeRepoImpl homeRepo;

  Future<Either<Failure, List<ExpertsByCatEntity>>> call(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    return await homeRepo.viewExpertsByCat(headers, data);
  }
}
