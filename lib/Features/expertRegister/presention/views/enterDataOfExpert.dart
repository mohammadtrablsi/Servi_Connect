import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servi_connect/Features/expertRegister/presention/manger/categoryCubit.dart';
import 'package:servi_connect/Features/expertRegister/domain/useCases/CategoryUseCase.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/expertRegisterRepoImp.dart';
import '../../domain/useCases/expertRegisterUseCase.dart';
import '../manger/expertRegisterCubit.dart';
import 'widgets/enterDataOfExpertBody.dart';

class EnterDataOfExpert extends StatelessWidget {
  const EnterDataOfExpert(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.repeatPassword,
      required this.phone,
      this.image});
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String repeatPassword;
  final String phone;
  final image;

  @override
  Widget build(BuildContext context) {
    final XFile imageo = XFile(image);
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return ExpertRegisterCubit(
                ExpertRegisterUseCase(
                  getIt.get<ExpertRegisterRepoImpl>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return CategoryCubit(
                CategoryUseCase(
                  expertRegisterRepo: getIt.get<ExpertRegisterRepoImpl>(),
                ),
              )..viewCategory();
            },
          ),
        ],
        child: EnterDataOfExpertBody(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            repeatPassword: repeatPassword,
            phone: phone,
            image: imageo),
      ),
    );
  }
}
