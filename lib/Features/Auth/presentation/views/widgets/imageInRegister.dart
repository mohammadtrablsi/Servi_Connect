import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';

class ImageInRegister extends StatelessWidget {
  const ImageInRegister({super.key, required this.imagePicked, this.onTap});
  final XFile? imagePicked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 50.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            shape: BoxShape.circle,
            image: imagePicked != null
                ? DecorationImage(
                    image: FileImage(File(imagePicked!.path)),
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: AssetImage(AssetsData.toDo2),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
            right: 15.w,
            bottom: 1.2.h,
            child: InkWell(
                onTap: onTap,
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: kPrimaryColor,
                    ))))),
      ],
    );
  }
}
