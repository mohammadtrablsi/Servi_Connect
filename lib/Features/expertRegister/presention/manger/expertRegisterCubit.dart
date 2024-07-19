import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/useCases/expertRegisterUseCase.dart';

part 'expertRegisterStates.dart';

class ExpertRegisterCubit extends Cubit<ExpertRegisterState> {
  ExpertRegisterCubit(this.expertRegisterUseCase)
      : super(ExpertRegisterInitial());
  GlobalKey<FormState>? formstate = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController experineceController = TextEditingController();
  bool isPassword = true;
  List<String>? listServices;

  final ExpertRegisterUseCase expertRegisterUseCase;
  Future<void> makeExpertRegister(
      FormData data, formstate, BuildContext context) async {
    if (checkValidationOfEnterData(formstate)) {
      mangeStateOfPostData(data).then((value) async {
        await Future.delayed(const Duration(seconds: 1));

        // GoRouter.of(context).go(AppRouter.kBottomNavRoute);
      });
    }
  }

  Future<void> mangeStateOfPostData(FormData data) async {
    emit(ExpertRegisterLoading());
    var result = await expertRegisterUseCase.call(data);
    print('resulttttttttttttttttttttttttttttttttttttttttt$result');
    result.fold((failure) {
      emit(ExpertRegisterFailure(failure.message));
    }, (_) {
      emit(ExpertRegisterSuccess());
    });
  }

  bool checkValidationOfEnterData(formstate) {
    if (formstate!.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void revPassword() {
    isPassword = !isPassword;
    emit(ExpertRegisterInitial());
  }

  void setInListServices(value) {
    bool isDeleted = false;
    for (int i = 0; i < listServices!.length; i++) {
      if (value == listServices![i]) {
        listServices!.removeAt(i);
        isDeleted = true;
      }
    }
    if (isDeleted == false) {
      listServices!.add(value);
    }
  }
}
