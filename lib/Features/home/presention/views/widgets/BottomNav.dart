import 'dart:math';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/chat/presention/views/usersChatsForExpert.dart';
import 'package:servi_connect/Features/favorite/presention/views/favorite.dart';
import 'package:servi_connect/Features/home/presention/views/home.dart';
import 'package:servi_connect/Features/profile/presention/views/profile.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List listPage = [
    const Home(),
    const Favorite(),
    const UsersChatsForExpert(),
    const Profile()
  ];
  int pageIndex = 0;
  // Assuming role can be null or non-null

  @override
  Widget build(BuildContext context) {
    print(role);
    List<GButton> tabs = [
      GButton(
        icon: Icons.home,
        text: 'Home',
        onPressed: () => setState(() {
          pageIndex = 0;
        }),
      ),
      GButton(
        icon: Icons.favorite,
        text: 'Likes',
        onPressed: () => setState(() {
          pageIndex = 1;
        }),
      ),
    ];

    if (role == 'expert') {
      tabs.insert(
        2,
        GButton(
          icon: Icons.chat,
          text: 'chats',
          onPressed: () => setState(() {
            pageIndex = 2;
          }),
        ),
      );
    }

    tabs.add(
      GButton(
        icon: Icons.person,
        text: 'Profile',
        onPressed: () => setState(() {
          pageIndex = 3;
        }),
      ),
    );

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0.5.w),
        child: GNav(
          haptic: true,
          tabBorderRadius: 10.sp,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 500),
          gap: 1.w,
          color: kPrimaryColor,
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: kPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          tabs: tabs,
        ),
      ),
      body: listPage.elementAt(pageIndex),
    );
  }
}
