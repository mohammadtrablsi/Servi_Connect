import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';
import 'package:servi_connect/Features/chat/domain/useCases/viewUsersChatForexpertUseCase.dart';
import 'package:servi_connect/Features/chat/presention/mangers/viewUsersChatForexpertCubit.dart';
import 'package:servi_connect/Features/chat/presention/views/widgets/usersChatsForExpertBody.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';
import 'package:servi_connect/main.dart';

class UsersChatsForExpert extends StatelessWidget {
  const UsersChatsForExpert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return ViewUsersChatForexpertCubit(
            ViewUsersChatForexpertUseCase(
              chatRepo: getIt.get<ChatRepoImpl>(),
            ),
          )..viewViewUsersChatForexpert(
              headers: {'token': prefs?.getString('token')}, data: {});
        },
        child: const UsersChatsForExpertBody(),
      ),
    );
  }
}
