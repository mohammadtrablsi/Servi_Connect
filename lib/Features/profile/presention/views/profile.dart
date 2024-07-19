import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servi_connect/Features/Profile/domain/useCases/profileUseCase.dart';
import 'package:servi_connect/Features/profile/data/repos/profileRepoImp.dart';
import 'package:servi_connect/Features/profile/presention/mangers/profileCubit.dart';
import 'package:servi_connect/Features/profile/presention/views/widgets/shimmerForDetailsInProfile.dart';
import 'package:servi_connect/core/utils/functions/getRole.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

import 'widgets/profileBody.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<bool> _determineRole() async {
    return await getRole() == 'user';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _determineRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerForDetailsInProfile();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final isUser = snapshot.data ?? false;
            return BlocProvider(
              create: (BuildContext context) {
                final profileCubit = ProfileCubit(
                  ProfileUseCase(
                    profileRepo: getIt.get<ProfileRepoImpl>(),
                  ),
                );
                profileCubit.viewProfile(data: {
                  'isUser': isUser,
                }, headers: {
                  'token':
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
                });
                return profileCubit;
              },
              child: const ProfileBody(),
            );
          }
        },
      ),
    );
  }
}
