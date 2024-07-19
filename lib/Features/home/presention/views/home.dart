import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/home/data/repos/homeRepoImp.dart';
import 'package:servi_connect/Features/home/domain/useCases/AdsUseCase.dart';
import 'package:servi_connect/Features/home/domain/useCases/CategoryUseCase.dart';
import 'package:servi_connect/Features/home/domain/useCases/ExpertsByCatUseCase.dart';
import 'package:servi_connect/Features/home/presention/mangers/adsCubit.dart';
import 'package:servi_connect/Features/home/presention/mangers/categoryCubit.dart';
import 'package:servi_connect/Features/home/presention/mangers/expertByCatCubit.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/homeBody.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return AdsCubit(
                AdsUseCase(
                  homeRepo: getIt.get<HomeRepoImpl>(),
                ),
              )..viewAds();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return CategoryCubit(
                CategoryUseCase(
                  homeRepo: getIt.get<HomeRepoImpl>(),
                ),
              )..viewCategory();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return ExpertsByCatCubit(
                ExpertsByCatUseCase(
                  homeRepo: getIt.get<HomeRepoImpl>(),
                ),
              )..viewExpertsByCat({
                  'token':
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
                }, {
                  'id': "6643cb546efa789e4c62f8b5"
                });
            },
          ),
        ],
        child: const HomeBody(),
      ),
    );
  }
}
