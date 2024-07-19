import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/Auth/domain/useCases/makeUserRegisterUseCase%20copy.dart';

import '../../../../core/utils/app_router.dart';
import '../../domain/useCases/makeRegisterUseCase.dart';
import 'package:image_picker/image_picker.dart';

part 'registerStates.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.makeUserRegisterUseCase) : super(RegisterInitial());
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isPassword1 = true;
  bool isPassword2 = true;
  XFile? imagePicked;

  final MakeUserRegisterUseCase makeUserRegisterUseCase;
  Future<void> makeUserRegister(
      FormData data, formstate, BuildContext context) async {
    if (checkValidationOfEnterData(formstate)) {
      mangeStateOfPostData(data).then((value) async {
        await Future.delayed(const Duration(seconds: 1));

        // GoRouter.of(context).go(AppRouter.kBottomNavRoute);
      });
    }
  }

  Future<void> mangeStateOfPostData(FormData data) async {
    emit(RegisterLoading());
    var result = await makeUserRegisterUseCase.call(data);
    print('resulttttttttttttttttttttttttttttttttttttttttt$result');
    result.fold((failure) {
      emit(RegisterFailure(failure.message));
    }, (_) {
      emit(RegisterSuccess());
    });
  }

  bool checkValidationOfEnterData(formstate) {
    if (formstate!.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void revPassword(int type) {
    if (type == 1) {
      isPassword1 = !isPassword1;
    } else {
      isPassword2 = !isPassword2;
    }

    emit(RegisterInitial());
  }

  Future pickImage() async {
    ImagePicker picker = ImagePicker();
// Pick an image.
    imagePicked = await picker.pickImage(source: ImageSource.gallery);
    emit(RegisterInitial());
  }
}
