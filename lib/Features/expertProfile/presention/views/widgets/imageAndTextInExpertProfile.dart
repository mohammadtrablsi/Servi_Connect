import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/core/utils/assets.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class ImageAndTextInExpertProfile extends StatelessWidget {
  ImageAndTextInExpertProfile(
      {super.key, this.name, this.image, required this.idOfAnother});
  final name;
  final String? image;
  final List contactsList = [Icons.chat, Icons.call];
  final String idOfAnother;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imagePart(),
        SizedBox(
          width: 4.w,
        ),
        rest(),
      ],
    );
  }

  Widget imagePart() {
    return Container(
      width: 32.w,
      height: 22.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image ?? ""), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(width: 0.31.h, color: kPrimaryColor)),
    );
  }

  Widget rest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 0.7.h,
        ),
        Row(
          children: List.generate(
            contactsList.length,
            (index) => Padding(
              padding: EdgeInsetsDirectional.only(end: 4.w),
              child: InkWell(
                onTap: () => AppRouter.router.push("${AppRouter.kChatRoute}?idOfAnother=$idOfAnother"),
                child: Container(
                  width: 7.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: Colors.grey.withOpacity(0.5)),
                  child: Center(
                    child: Icon(
                      contactsList[index],
                      size: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
