import 'package:dartz/dartz.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';
import 'package:servi_connect/Features/search/data/repos/searchRepoImp.dart';
import 'package:servi_connect/core/errors/failure.dart';


class SearchUseCase {
  SearchUseCase( {required this.searchRepo});
  SearchRepoImpl searchRepo;


  Future<Either<Failure, List<SearchEntity>>> call(
      String param, Map<String, dynamic> headers) async {
    return await searchRepo.makeSearch(query: param, headers: headers);
  }
}
