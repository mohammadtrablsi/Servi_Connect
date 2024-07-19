import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/Favorite/data/dataSources/FavoriteDataSource.dart';

import 'package:servi_connect/Features/favorite/domain/useCases/favoriteUseCase.dart';
import 'package:servi_connect/Features/favorite/presention/mangers/favoriteCubit.dart';

import 'package:servi_connect/Features/favorite/presention/views/widgets/favoriteBody.dart';
import 'package:servi_connect/core/utils/api_service.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

import '../../data/repos/FavoriteRepoImp.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ApiService api = ApiService(dio);
    FavoriteRemoteDataSource favoriteRemoteDataSource =
        FavoriteRemoteDataSourceImpl(api);
    FavoriteRepoImpl favoriteRepoImpl =
        FavoriteRepoImpl(favoriteRemoteDataSource: favoriteRemoteDataSource);
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return FavoriteCubit(
            FavoriteUseCase(
              favoriteRepo: favoriteRepoImpl,
            ),
          )..viewFavorite(headers: {
              'token':
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
            });
        },
        child: const FavoriteBody(),
      ),
    );
  }
}
