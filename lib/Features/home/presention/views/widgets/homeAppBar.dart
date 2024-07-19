import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});
  final List icons = [Icons.menu, Icons.search];
  final double size = 18.sp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Icon(
            icons[0],
            size: size,
          ),
        ),
        const Spacer(),
        InkWell(
          child: Icon(icons[1], size: size),
          onTap: () => AppRouter.router.push(AppRouter.kSearchRoute),
        ),
      ],
    );
  }
}
