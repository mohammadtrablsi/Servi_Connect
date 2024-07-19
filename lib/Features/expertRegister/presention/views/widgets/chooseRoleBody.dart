import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class ChooseRoleBody extends StatelessWidget {
  const ChooseRoleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Get Started",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                ),
                Text(
                  "sign up by choosing your role",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
          roleItem(kPrimaryColor, "I'm a User", () {
            setRole('user');
            GoRouter.of(context).go(AppRouter.kLoginRoute);
          }),
          SizedBox(
            height: 1.h,
          ),
          roleItem(kPrimaryColor.withOpacity(0.5), "I'm an Expert", () {
            setRole('expert');
            GoRouter.of(context).go(AppRouter.kLoginRoute);
          }),
        ],
      ),
    );
  }

  Widget roleItem(Color color, String text, void Function()? onTap) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 3.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(18.sp)),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_right,
                  size: 20.sp,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }

}
