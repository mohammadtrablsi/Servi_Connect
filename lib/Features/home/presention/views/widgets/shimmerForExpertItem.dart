import 'package:flutter/material.dart';
import 'package:servi_connect/core/utils/assets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class ShimmerForExpertItem extends StatelessWidget {
  const ShimmerForExpertItem({super.key});

  //  final List<String> text;
  // final String imageUrl;
  // const ItemInDetailsOfOrde(
  //     {super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // List listData = ['2.5', 'Alexandr', 'medicine', '50'];
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
          height: 10.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15.sp),
          )),
    );
  }
}
