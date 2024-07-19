import 'package:flutter/material.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/expertItem.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerForExpertItem.dart';
import 'package:sizer/sizer.dart';

class ShimmerForAvailbleServicesPart extends StatelessWidget {
  const ShimmerForAvailbleServicesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Availble Services",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 43.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(bottom: 2.w),
                child: const ShimmerForExpertItem(),
              );
            },
          ),
        )
      ],
    );
  }
}
