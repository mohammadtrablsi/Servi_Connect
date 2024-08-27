import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servi_connect/Features/Profile/domain/useCases/profileUseCase.dart';
import 'package:servi_connect/Features/profile/data/repos/profileRepoImp.dart';
import 'package:servi_connect/Features/profile/presention/mangers/profileCubit.dart';
import 'package:servi_connect/Features/profile/presention/views/widgets/shimmerForDetailsInProfile.dart';
import 'package:servi_connect/core/utils/functions/getRole.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';
import 'package:servi_connect/main.dart';

import 'widgets/profileBody.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) {
        final profileCubit = ProfileCubit(
          ProfileUseCase(
            profileRepo: getIt.get<ProfileRepoImpl>(),
          ),
        );
        profileCubit.viewProfile(data: {
          'isUser': prefs?.getString('role')=='user' ,
        }, headers: {
          'token': prefs?.getString('token')
        });
        return profileCubit;
      },
      child: const ProfileBody(),
    ));
  }
}
