import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/home/data/repos/homeRepoImp.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';


class AdsUseCase {
  AdsUseCase( {required this.homeRepo});
  HomeRepoImpl homeRepo;


  Future<Either<Failure, List<AdsEntity>>> call() async {
    return await homeRepo.viewAds();
  }
}
