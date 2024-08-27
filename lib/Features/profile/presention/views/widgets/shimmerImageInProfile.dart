import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/core/utils/assets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerImageInProfile extends StatelessWidget {
  const ShimmerImageInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 40.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
    );
  }
}
