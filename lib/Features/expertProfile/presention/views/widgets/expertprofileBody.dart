import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/expertProfile/presention/mangers/makeFavoriteCubit.dart';
import 'package:servi_connect/main.dart';
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
      required this.phone,
      this.image,
      this.idOfExpert});
  final String name;
  final String exprience;
  final String address;
  final String email;
  final String phone;
  final String? image;
  final String? idOfExpert;


  @override
  Widget build(BuildContext context) {
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwwww$idOfExpert");
    final makeFavoriteCubit = context.read<MakeFavoriteCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                ImageAndTextInExpertProfile(name: name, image: image, idOfAnother: idOfExpert!,),
                TextsInExpertProfile(
                    exprience: exprience,
                    address: address,
                    email: email,
                    phone: phone),
              ],
            ),
            BlocBuilder<MakeFavoriteCubit, MakeFavoriteState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    IconButton(
                        onPressed: () async {
                          makeFavoriteCubit.makeFavoriteStyle();
                          await makeFavoriteCubit.makeFavorite(
                              data: {"id": idOfExpert},
                              headers: {'token': prefs?.getString('token')});
                        },
                        icon: Icon(
                          makeFavoriteCubit.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.red,
                          size: 22.sp,
                        )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
