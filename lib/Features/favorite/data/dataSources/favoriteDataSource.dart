import 'package:servi_connect/Features/Favorite/data/models/FavoriteModel.dart';
import 'package:servi_connect/Features/favorite/domain/entites/favoriteEntity.dart';

import '../../../../core/utils/api_service.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteEntity>> viewFavorite(
      {required Map<String, dynamic> headers});
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;

  FavoriteRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<FavoriteEntity>> viewFavorite(
      {required Map<String, dynamic> headers}) async {
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkk$query');
    var response = await apiService.get(
        data: {},
        endPoint: 'http://10.0.2.2:8000/api/favorite',
        headers: headers);
    // FavoriteEntity entity;
    // entity = FavoriteModel.fromJson(response);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    List<FavoriteEntity> Favorites = getFavoritesList(response);
    // saveFavoritesData(Favorites, kFavoritesBox);
    // await prefs.setInt('userId', entity.id);
    // print("iddddddddddddddddddddddddddddddddddd${entity.id}");
    return Favorites;
  }

  List<FavoriteEntity> getFavoritesList(Map<String, dynamic> data) {
    List<FavoriteEntity> Favorites = [];
    for (var FavoriteMap in data['favorites']) {
      Favorites.add(FavoriteModel.fromJson(FavoriteMap));
    }
    return Favorites;
  }
}
