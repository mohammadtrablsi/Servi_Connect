import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authButton.dart';
import 'package:servi_connect/Features/profile/presention/mangers/profileCubit.dart';
import 'package:servi_connect/Features/profile/presention/views/widgets/shimmerForDetailsInProfile.dart';
import 'package:sizer/sizer.dart';

import 'detailsInProfile.dart';
import 'imageInProfile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return SafeArea(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageInProfile(),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
            if (state is ProfileLoading) {
              return ShimmerForDetailsInProfile();
            } else if (state is ProfileFailure) {
              return const Text('error');
            } else if (state is ProfileSuccess) {
              return DetailsInProfile(data: state.profile);
            } else {
              return const SizedBox();
            }
          }),
          SizedBox(
            height: 4.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthButton(
                widget: Text(
                  "logout",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                radius: 20.sp,
                paddinghorizontal: 7.h,
                paddingvertical: 2.h,
                onpressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
