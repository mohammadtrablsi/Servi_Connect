import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:sizer/sizer.dart';

class ButtonsInSearchScreen extends StatelessWidget {
  const ButtonsInSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 43.w,
          padding: EdgeInsets.symmetric(vertical: 1.8.h),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.sp),
                  topLeft: Radius.circular(30.sp))),
          child: Center(
            child: Text(
              'Category',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),

////////////////////////////////////////////////////optimize
        Container(
          width: 43.w,
          padding: EdgeInsets.symmetric(vertical: 1.8.h,),
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp))),
          child: Center(
            child: Text(
              'Expert',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
