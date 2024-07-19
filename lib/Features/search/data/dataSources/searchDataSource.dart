import 'package:servi_connect/Features/search/data/models/searchModel.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';

import '../../../../core/utils/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntity>> makeSearch(
      {required String query, required Map<String, dynamic> headers});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<SearchEntity>> makeSearch(
      {required String query, required Map<String, dynamic> headers}) async {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.get(
        data: {},
        endPoint: 'http://10.0.2.2:8000/api/expert?query=$query',
        headers: headers);
    // SearchEntity entity;
    // entity = SearchModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    List<SearchEntity> searchs = getsearchsList(response);
    // savesearchsData(searchs, ksearchsBox);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return searchs;
  }

  List<SearchEntity> getsearchsList(Map<String, dynamic> data) {
    List<SearchEntity> searchs = [];
    for (var searchMap in data['data']) {
      searchs.add(SearchModel.fromJson(searchMap));
    }
    return searchs;
  }
}
