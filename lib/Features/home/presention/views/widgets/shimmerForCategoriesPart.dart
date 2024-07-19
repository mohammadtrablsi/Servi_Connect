import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/categoriesItem.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerForCategoriesPart extends StatelessWidget {
  const ShimmerForCategoriesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 4.w),
          child: Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 2.w),
                child: Shimmer.fromColors(
                     baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 30.w,
                    height: 1.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10.sp), color: Colors.grey,),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
