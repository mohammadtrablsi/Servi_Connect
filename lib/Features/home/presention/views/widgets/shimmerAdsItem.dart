import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerAdsItem extends StatelessWidget {
  const ShimmerAdsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
       baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
      period: const Duration(seconds: 2),
      child: Container(
        height: 20.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}