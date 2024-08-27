import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/expertProfile/data/repos/expertProfileRepoImp.dart';
import 'package:servi_connect/Features/expertProfile/domain/useCases/getExpertById.dart';
import 'package:servi_connect/Features/expertProfile/domain/useCases/makeFavoriteUseCase.dart';
import 'package:servi_connect/Features/expertProfile/presention/mangers/getExpertByIdCubit.dart';
import 'package:servi_connect/Features/expertProfile/presention/mangers/makeFavoriteCubit.dart';
import 'package:servi_connect/Features/expertProfile/presention/views/widgets/expertprofileBody.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';
import 'package:servi_connect/main.dart';

class ExpertProfile extends StatelessWidget {
  const ExpertProfile(
      {super.key,
      this.name,
      this.exprience,
      this.address,
      this.email,
      this.phone,
      this.image,
      this.idOfExpert,
      this.isMyExpertProfile = false});
  final String? name;
  final String? exprience;
  final String? address;
  final String? email;
  final String? phone;
  final String? image;
  final String? idOfExpert;
  final bool isMyExpertProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return MakeFavoriteCubit(
                MakeFavoriteUseCase(
                  getIt.get<ExpertProfileRepoImpl>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return GetExpertByIdCubit(
                GetExpertByIdUseCase(
                  getIt.get<ExpertProfileRepoImpl>(),
                ),
              )..getExpertById(
                  headers: {'token': prefs?.getString('token')}, request: {});
            },
          ),
        ],
        child: isMyExpertProfile
            ? BlocBuilder<GetExpertByIdCubit, GetExpertByIdState>(
                builder: (context, state) {
                  if (state is GetExpertByIdSuccess) {
                    return ExpertProfileBody(
                        name: "${state.data.firstName}${state.data.lastName}",
                        exprience: state.data.experence,
                        address: state.data.address,
                        email: state.data.email,
                        phone: state.data.email,
                        image: state.data.image,
                        idOfExpert: state.data.idOfExpert);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            : ExpertProfileBody(
                name: name ?? "",
                exprience: exprience ?? "",
                address: address ?? "",
                email: email ?? "",
                phone: phone ?? "",
                image: image,
                idOfExpert: idOfExpert),
      ),
    );
  }
}
