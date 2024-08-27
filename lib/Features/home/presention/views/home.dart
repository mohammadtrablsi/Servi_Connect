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
import 'package:servi_connect/main.dart';

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
              final categoryCubit = context.read<CategoryCubit>();
              return ExpertsByCatCubit(
                ExpertsByCatUseCase(
                  homeRepo: getIt.get<HomeRepoImpl>(),
                ),
              );
            },
          ),
        ],
        child: const HomeBody(),
      ),
    );
  }
}
