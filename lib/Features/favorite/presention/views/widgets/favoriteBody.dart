import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/favorite/presention/mangers/favoriteCubit.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/expertItem.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerForExpertItem.dart';
import 'package:sizer/sizer.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              'My Favorite',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
              if (state is FavoriteLoading) {
                return Expanded(
                  // height: 42.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 2.w),
                        child: const ShimmerForExpertItem(),
                      );
                    },
                  ),
                );
              } else if (state is FavoriteFailure) {
                return const Text('error');
              } else if (state is FavoriteSuccess) {
                return Expanded(
                  // height: 42.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: state.Favorites.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 2.w),
                        child: ExpertItem(data: state.Favorites[index]),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
