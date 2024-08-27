import 'package:flutter/material.dart';
import 'package:servi_connect/Features/Profile/domain/entites/ProfileEntity.dart';

import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';

class DetailsInProfile extends StatelessWidget {
  DetailsInProfile({super.key, required this.data});
  final ProfileEntity data;
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
                        index == 0
                            ? containtOfLabel(list[index]['icon'], 'user')
                            : index == 1
                                ? containtOfLabel(list[index]['icon'],
                                    '${data.firstName}${data.lastName}')
                                : index == 2
                                    ? containtOfLabel(
                                        list[index]['icon'], data.email)
                                    : containtOfLabel(
                                        list[index]['icon'], data.phone),
                      ],
                    ),
                  ))),
    );
  }

  Widget containtOfLabel(icon, String text) {
    return Container(
      width: 70.w,
      padding: EdgeInsets.symmetric(vertical: 1.7.h),
      decoration: BoxDecoration(
          border: Border.all(width: 0.1.h, color: kPrimaryColor),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 3.w),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
