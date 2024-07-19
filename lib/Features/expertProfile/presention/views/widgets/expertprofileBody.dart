import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/expertProfile/presention/mangers/makeFavoriteCubit.dart';
import 'package:sizer/sizer.dart';

import 'imageAndTextInExpertProfile.dart';
import 'textsInExpertProfile.dart';

class ExpertProfileBody extends StatelessWidget {
  const ExpertProfileBody(
      {super.key,
      required this.name,
      required this.exprience,
      required this.address,
      required this.email,
      required this.phone});
  final String name;
  final String exprience;
  final String address;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final makeFavoriteCubit = context.read<MakeFavoriteCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                ImageAndTextInExpertProfile(data: name),
                TextsInExpertProfile(
                    exprience: exprience,
                    address: address,
                    email: email,
                    phone: phone),
              ],
            ),
            BlocBuilder<MakeFavoriteCubit, MakeFavoriteState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () async {
                      makeFavoriteCubit.makeFavoriteStyle();
                      await makeFavoriteCubit.makeFavorite(data: {
                        "id": "6675858aa796a2fb2d9aaf8a"
                      }, headers: {
                        'token':
                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
                      });
                    },
                    icon: Icon(
                      makeFavoriteCubit.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.red,
                      size: 22.sp,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
