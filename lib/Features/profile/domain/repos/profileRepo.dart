import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';


import '../../../../core/errors/failure.dart';


abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> viewProfile(
      {required Map<String, dynamic> data,required Map<String, dynamic> headers});
}
