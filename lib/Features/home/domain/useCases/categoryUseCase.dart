import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/home/data/repos/homeRepoImp.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';


class CategoryUseCase {
  CategoryUseCase( {required this.homeRepo});
  HomeRepoImpl homeRepo;


  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await homeRepo.viewCategory();
  }
}
