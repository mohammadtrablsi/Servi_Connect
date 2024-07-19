import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';
import 'package:servi_connect/Features/chat/domain/useCases/viewUsersChatForexpertUseCase.dart';
import 'package:servi_connect/Features/chat/presention/mangers/viewUsersChatForexpertCubit.dart';
import 'package:servi_connect/Features/chat/presention/views/widgets/usersChatsForExpertBody.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

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
          )..viewViewUsersChatForexpert(headers: {
              'token':
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
            }, data: {
              "id": "6644bdffd078b7fc6d634016"
            });
        },
        child: const UsersChatsForExpertBody(),
      ),
    );
  }
}
