import 'package:flutter/material.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';

class ShimmerForDetailsInProfile extends StatelessWidget {
  ShimmerForDetailsInProfile({super.key});

  List list = [
    {'label': 'My Role', 'icon': Icons.person},
    {'label': 'My Name', 'icon': Icons.person},
    {'label': 'My Email', 'icon': Icons.email},
    {'label': 'My Phone', 'icon': Icons.phone},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
          children: List.generate(
              4,
              (index) => Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 2.h),
                    child: Row(
                      children: [
                        Text(
                          list[index]['label'],
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        containtOfLabel(),
                      ],
                    ),
                  ))),
    );
  }

  Widget containtOfLabel() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 70.w,
        height: 6.h,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(width: 0.1.h, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(20.sp)),
      ),
    );
  }
}
