import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/presention/views/widgets/expertItem.dart';
import '../../../../home/presention/views/widgets/shimmerForExpertItem.dart';

class ShimmerForResultSearchPart extends StatelessWidget {
  const ShimmerForResultSearchPart({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 42.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
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
      ),
    );
  }
}
