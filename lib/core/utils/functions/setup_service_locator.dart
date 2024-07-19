import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:servi_connect/Features/Auth/data/dataSources/loginRemoteDataSource.dart';
import 'package:servi_connect/Features/Auth/data/repos/loginRepoImp.dart';
import 'package:servi_connect/Features/Favorite/data/dataSources/FavoriteDataSource.dart';
import 'package:servi_connect/Features/chat/data/dataSources/chatDataSource.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';

import 'package:servi_connect/Features/expertProfile/data/dataSources/expertProfileRemoteDataSource.dart';
import 'package:servi_connect/Features/expertProfile/data/repos/expertProfileRepoImp.dart';
import 'package:servi_connect/Features/expertRegister/data/dataSources/expertRegisterRemoteDataSource.dart';
import 'package:servi_connect/Features/expertRegister/data/repos/expertRegisterRepoImp.dart';
import 'package:servi_connect/Features/home/data/repos/homeRepoImp.dart';
import 'package:servi_connect/Features/profile/data/dataSources/profileDataSource.dart';
import 'package:servi_connect/Features/profile/data/repos/profileRepoImp.dart';
import 'package:servi_connect/Features/search/data/dataSources/searchDataSource.dart';
import 'package:servi_connect/Features/search/data/repos/searchRepoImp.dart';
import 'package:servi_connect/Features/tasks/data/dataSources/tasksLocalDataSource.dart';
import 'package:servi_connect/Features/tasks/data/dataSources/tasksRemoteDataSource.dart';
import 'package:servi_connect/Features/tasks/data/repos/tasksRepoImp.dart';
import 'package:servi_connect/core/utils/api_service.dart';

import '../../../Features/Favorite/data/repos/FavoriteRepoImp.dart';
import '../../../Features/home/data/dataSources/homeDataSource.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  // getIt.registerSingleton<TasksRepoImpl>(
  //   TasksRepoImpl(
  //     tasksRemoteDataSource: TasksRemoteDataSourceImpl(
  //       getIt.get<ApiService>(),
  //     ),
  //     tasksLocalDataSource: TasksLocalDataSourceImpl(),
  //   ),
  // );

  getIt.registerSingleton<ExpertRegisterRepoImpl>(
    ExpertRegisterRepoImpl(
      expertRegisterRemoteDataSource: ExpertRegisterRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      profileRemoteDataSource: ProfileRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<ExpertProfileRepoImpl>(
    ExpertProfileRepoImpl(
      expertProfileRemoteDataSource: ExpertProfileRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<FavoriteRepoImpl>(
    FavoriteRepoImpl(
      favoriteRemoteDataSource: FavoriteRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<ChatRepoImpl>(
    ChatRepoImpl(
      chatRemoteDataSource: ChatRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
