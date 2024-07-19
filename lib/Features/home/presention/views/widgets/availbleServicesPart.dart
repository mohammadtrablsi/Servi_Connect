import 'package:flutter/material.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/categoriesItem.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/expertItem.dart';
import 'package:sizer/sizer.dart';

class AvailbleServicesPart extends StatelessWidget {
  const AvailbleServicesPart({super.key, required this.data});
  final List<ExpertsByCatEntity> data;

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
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(bottom: 2.w),
                child: ExpertItem(
                  data: data[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
