import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/home/presention/mangers/adsCubit.dart';
import 'package:servi_connect/Features/home/presention/mangers/categoryCubit.dart';
import 'package:servi_connect/Features/home/presention/mangers/expertByCatCubit.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/carouselSliderPart.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/homeAppBar.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerForAvailbleServicesPart.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerForCategoriesPart.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';

import 'availbleServicesPart.dart';
import 'categoriesPart.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final adsCubit = context.read<AdsCubit>();
    final categoryCubit = context.read<CategoryCubit>();
    final expertsByCatCubit = context.read<ExpertsByCatCubit>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: HomeAppBar(),
          ),
          SizedBox(height: 2.h),
          BlocBuilder<AdsCubit, AdsState>(builder: (context, state) {
            if (state is AdsLoading) {
              return CarouselSliderPart(
                data: [],
                indexOfCarouselSlider: 1,
                setIndexOfCarouslSlider:
                    (index) {}, // Provide a default empty function
                adsIsLoading: true,
              );
            } else if (state is AdsFailure) {
              return const Text('error');
            } else if (state is AdsSuccess) {
              return CarouselSliderPart(
                data: state.Ads,
                indexOfCarouselSlider: 1,
                setIndexOfCarouslSlider:
                    (index) {}, // Provide a default empty function
                adsIsLoading: false,
              );
            } else {
              return const SizedBox();
            }
          }),
          SizedBox(height: 1.h),
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
            if (state is CategoryLoading) {
              return const ShimmerForCategoriesPart();
            } else if (state is CategoryFailure) {
              return const Text('error');
            } else if (state is CategorySuccess) {
              categoryCubit.data = state.categories;
              expertsByCatCubit.viewExpertsByCat(
                  {'token': prefs?.getString("token")},
                  {'id': state.categories[0].id});
              return CategoriesPart(
                data: state.categories,
                numberOfPressed: categoryCubit.numberOfPressed,
              );
            } else if (state is CategoryChange) {
              return CategoriesPart(
                data: categoryCubit.data!,
                numberOfPressed: categoryCubit.numberOfPressed,
              );
            } else {
              return const SizedBox();
            }
          }),
          SizedBox(height: 2.h),
          BlocBuilder<ExpertsByCatCubit, ExpertsByCatState>(
              builder: (context, state) {
            if (state is ExpertsByCatLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: const ShimmerForAvailbleServicesPart(),
              );
            } else if (state is ExpertsByCatFailure) {
              return const Text('error');
            } else if (state is ExpertsByCatSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: AvailbleServicesPart(data: state.expertsByCat),
              );
            } else {
              return const SizedBox();
            }
          }),
        ]),
      )),
    );
  }
}
