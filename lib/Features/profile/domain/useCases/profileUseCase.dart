import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';
import 'package:servi_connect/Features/profile/data/repos/profileRepoImp.dart';
import 'package:servi_connect/core/errors/failure.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';


import '../../../../core/use_cases/use_case.dart';

import '../repos/profileRepo.dart';

class ProfileUseCase {
  ProfileUseCase( {required this.profileRepo});
  ProfileRepoImpl profileRepo;

  @override
  Future<Either<Failure, ProfileEntity>> call(
      Map<String, dynamic> param, Map<String, dynamic> headers) async {
    return await profileRepo.viewProfile(data: param, headers: headers);
  }
}
