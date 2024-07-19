import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/core/utils/assets.dart';
import 'package:sizer/sizer.dart';

class ImageInProfile extends StatelessWidget {
  const ImageInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 28.h,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsData.toDo2), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(width: 0.31.h, color: kPrimaryColor)),
    );
  }
}
