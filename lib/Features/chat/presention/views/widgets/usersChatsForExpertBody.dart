import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/chat/presention/mangers/viewUsersChatForexpertCubit.dart';
import 'package:servi_connect/Features/chat/presention/views/widgets/userItem.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/expertItem.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerForExpertItem.dart';
import 'package:sizer/sizer.dart';

class UsersChatsForExpertBody extends StatelessWidget {
  const UsersChatsForExpertBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewUsersChatForexpertCubit =
        context.read<ViewUsersChatForexpertCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              'My Chats',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<ViewUsersChatForexpertCubit,
                ViewUsersChatForexpertState>(builder: (context, state) {
              if (state is ViewUsersChatForexpertLoading) {
                return Expanded(
                  // height: 42.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 2.w),
                        child: const ShimmerForExpertItem(),
                      );
                    },
                  ),
                );
              } else if (state is ViewUsersChatForexpertFailure) {
                return const Text('error');
              } else if (state is ViewUsersChatForexpertSuccess) {
                return Expanded(
                  // height: 42.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: state.viewUsersChatForexperts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 2.w),
                        child: UserItem(
                            data: state.viewUsersChatForexperts[index]),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
