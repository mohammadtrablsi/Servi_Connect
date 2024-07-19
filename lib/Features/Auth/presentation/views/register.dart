
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/Auth/domain/useCases/makeUserRegisterUseCase%20copy.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/loginBody.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../domain/useCases/makeRegisterUseCase.dart';
import '../manger/loginCubit.dart';
import '../../data/repos/loginRepoImp.dart';
import '../manger/registerCubit.dart';
import 'widgets/registerBody.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) {
            return RegisterCubit(
              MakeUserRegisterUseCase(
                getIt.get<LoginRepoImpl>(),
              ),
            );
          },
          child: const RegisterBody(),
        ),
      ),
    );
  }
}
