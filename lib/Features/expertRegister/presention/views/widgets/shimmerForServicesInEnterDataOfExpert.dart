import 'package:flutter/material.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerForServicesInEnterDataOfExpert extends StatelessWidget {
  const ShimmerForServicesInEnterDataOfExpert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
