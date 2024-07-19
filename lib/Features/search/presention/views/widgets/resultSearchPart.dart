import 'package:flutter/material.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/presention/views/widgets/expertItem.dart';

class ResultSearchPart extends StatelessWidget {
  const ResultSearchPart({super.key, required this.data});
  final List<SearchEntity> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 42.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 1.h),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(bottom: 2.w),
              child: ExpertItem(data:data[index]),
            );
          },
        ),
      ),
    );
  }
}
