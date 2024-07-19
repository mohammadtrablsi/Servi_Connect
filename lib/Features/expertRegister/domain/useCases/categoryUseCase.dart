import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/expertRegister/data/repos/expertRegisterRepoImp.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/core/errors/failure.dart';


class CategoryUseCase {
  CategoryUseCase( {required this.expertRegisterRepo});
  ExpertRegisterRepoImpl expertRegisterRepo;


  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await expertRegisterRepo.viewCategory();
  }
}
