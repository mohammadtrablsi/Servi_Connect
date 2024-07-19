
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:servi_connect/Features/search/data/dataSources/searchDataSource.dart';
import 'package:servi_connect/Features/search/domain/repos/searchRepo.dart';

import '../../../../core/errors/failure.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';


class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<SearchEntity>>> makeSearch(
      {required String query,required Map<String, dynamic> headers}) async {
    List<SearchEntity> searchList;
    try {
      // searchList = searchLocalDataSource.getAllsearchs(
      //   pageNumber: page['pageNumber'],
      // );
      // if (searchList.isNotEmpty) {
      //   return right(searchList);
      // }
      searchList = await searchRemoteDataSource.makeSearch(query: query,headers:headers);
      print('temooooooooooooooooooooooooooooooooooooo$searchList');
      return right(searchList);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
      print('333333333333333333333');
      return left(ServerFailure(e.toString()));
    }
  }
}

