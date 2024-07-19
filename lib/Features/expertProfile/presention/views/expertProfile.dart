import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/expertProfile/data/repos/expertProfileRepoImp.dart';
import 'package:servi_connect/Features/expertProfile/domain/useCases/makeFavoriteUseCase.dart';
import 'package:servi_connect/Features/expertProfile/presention/mangers/makeFavoriteCubit.dart';
import 'package:servi_connect/Features/expertProfile/presention/views/widgets/expertprofileBody.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

class ExpertProfile extends StatelessWidget {
  const ExpertProfile(
      {super.key,
      required this.name,
      required this.exprience,
      required this.address,
      required this.email,
      required this.phone});
  final String name;
  final String exprience;
  final String address;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return MakeFavoriteCubit(
            MakeFavoriteUseCase(
              getIt.get<ExpertProfileRepoImpl>(),
            ),
          );
        },
        child: ExpertProfileBody(
            name:name,
            exprience: exprience,
            address: address,
            email: email,
            phone: phone),
      ),
    );
  }
}
