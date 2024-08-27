import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_router.dart';
import '../../domain/useCases/makeRegisterUseCase.dart';

part 'loginStates.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isPassword = true;

  final LoginUseCase loginUseCase;
  Future<void> makeLogin(
      Map<String, dynamic> data, formstate, BuildContext context) async {
    if (checkValidationOfEnterData(formstate)) {
      mangeStateOfPostData(data, context);

      
    }
  }

  Future<void> mangeStateOfPostData(Map<String, dynamic> data, BuildContext context) async {
    emit(LoginLoading());
    var result = await loginUseCase.call(data);
    print('resulttttttttttttttttttttttttttttttttttttttttt$result');
    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (_) {
      emit(LoginSuccess());
      
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
    emit(LoginInitial());
  }


}
