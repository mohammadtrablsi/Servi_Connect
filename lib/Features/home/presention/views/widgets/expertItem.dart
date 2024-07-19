import 'package:flutter/material.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';
import 'package:servi_connect/core/utils/assets.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class ExpertItem extends StatelessWidget {
  const ExpertItem({super.key, required this.data});
  final data;

  //  final List<String> text;
  // final String imageUrl;
  // const ItemInDetailsOfOrde(
  //     {super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    List listData = [];
    listData.add("${data.firstName}${data.lastName}");
    listData.add(data.firstName);

    // List listData = ['2.5', 'Alexandr', 'medicine', '50'];
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
          elevation: 0.5,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0.7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Colors.black12,
                      image: const DecorationImage(
                          image: AssetImage(AssetsData.toDo2),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.3.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(listData.length, (index) {
                        return Container(
                          // padding: EdgeInsets.only(top: 0.2, bottom: 0.2.h),
                          constraints: BoxConstraints(maxWidth: 50.w),
                          child: Text(
                            listData[index],
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      })),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 5.w),
          child: InkWell(
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15.sp,
            ),
            onTap: () => AppRouter.router.push(
                '${AppRouter.kExpertProfileRoute}?name=${data.firstName}${data.lastName}&&exprience=${data.experence}&&address=${data.address}&&email=${data.email}&&phone=${data.email}'),
          ),
        ),
      ],
    );
  }
}
