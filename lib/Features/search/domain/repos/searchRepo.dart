import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';


import '../../../../core/errors/failure.dart';


abstract class SearchRepo {
  Future<Either<Failure, List<SearchEntity>>> makeSearch(
      {required String query,required Map<String, dynamic> headers});
}
