import 'package:flutter/material.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key, required this.data, required this.isPressed});
  final CategoryEntity data;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      // height: 10.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: isPressed ? kPrimaryColor : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   width: 20.w,
          //   height: 6.h,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5.sp),
          //       image: const DecorationImage(
          //           image: AssetImage(AssetsData.toDo2), fit: BoxFit.cover)),
          // ),
          // SizedBox(
          //   height: 0.8.h,
          // ),
          Container(
            constraints: BoxConstraints(maxWidth: 25.w),
            child: Text(
              data.name,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: isPressed ? Colors.white : kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
