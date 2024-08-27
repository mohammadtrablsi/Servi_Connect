import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authButton.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authTextField.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/clipPathInAuth.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/imageInRegister.dart';
import 'package:servi_connect/core/utils/functions/getRole.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/appToast.dart';
import '../../../../../core/utils/functions/validatore.dart';
import '../../manger/registerCubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return ClipPathInAuth(
      widget: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Form(
                      key: registerCubit.formstate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 43.w,
                                child: AuthTextField(
                                  controller: registerCubit.firstName,
                                  label: 'first name',
                                  preIcon: Icons.person,
                                  vaildator: (val) {
                                    return vaildator(val!, 2, 20, 'name');
                                  },
                                  obscureText: false,
                                  suffixIcon: null,
                                  suffixIconOnPressed: () {},
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 43.w,
                                child: AuthTextField(
                                  controller: registerCubit.lastName,
                                  label: 'last name',
                                  preIcon: Icons.person,
                                  vaildator: (val) {
                                    return vaildator(val!, 2, 20, 'name');
                                  },
                                  obscureText: false,
                                  suffixIcon: null,
                                  suffixIconOnPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AuthTextField(
                            controller: registerCubit.email,
                            label: 'enter your email',
                            preIcon: Icons.email,
                            vaildator: (val) {
                              return vaildator(val!, 5, 15, 'email');
                            },
                            obscureText: false,
                            suffixIcon: null,
                            suffixIconOnPressed: () {},
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                            return AuthTextField(
                              maxLines: 1,
                              controller: registerCubit.password,
                              label: 'enter your password',
                              preIcon: Icons.password,
                              vaildator: (val) {
                                return vaildator(val!, 5, 15, 'password');
                              },
                              obscureText: registerCubit.isPassword1,
                              suffixIcon: registerCubit.isPassword1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixIconOnPressed: () {
                                registerCubit.revPassword(1);
                              },
                            );
                          }),
                          SizedBox(
                            height: 1.h,
                          ),
                          BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                            return AuthTextField(
                              maxLines: 1,
                              controller: registerCubit.repeatPassword,
                              label: 'confirm password',
                              preIcon: Icons.password,
                              vaildator: (val) {
                                return vaildator(val!, 5, 15, 'password');
                              },
                              obscureText: registerCubit.isPassword2,
                              suffixIcon: registerCubit.isPassword2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixIconOnPressed: () {
                                registerCubit.revPassword(2);
                              },
                            );
                          }),
                          SizedBox(
                            height: 1.h,
                          ),
                          AuthTextField(
                            controller: registerCubit.phone,
                            label: 'enter your phone',
                            preIcon: Icons.phone,
                            vaildator: (val) {
                              return vaildator(val!, 5, 15, 'number');
                            },
                            obscureText: false,
                            suffixIcon: null,
                            suffixIconOnPressed: () {
                              // loginCubit.revPassword();
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AuthButton(
                                widget:
                                    BlocListener<RegisterCubit, RegisterState>(
                                  listener: (context, state) {
                                    if (state is RegisterSuccess) {
                                      appToast(
                                          context, 'Registration successful!');
                                      AppRouter.router
                                          .push(AppRouter.kBottomNavRoute);
                                    } else if (state is RegisterFailure) {
                                      appToast(context, 'faild');
                                    }
                                  },
                                  child:
                                      BlocBuilder<RegisterCubit, RegisterState>(
                                    builder: (context, state) {
                                      if (state is RegisterLoading) {
                                        return SizedBox(
                                          height: 3.h,
                                          width: 6.w,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          "continue",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                radius: 20.sp,
                                paddinghorizontal: 7.h,
                                paddingvertical: 2.h,
                                onpressed: () async {
                                  if (await prefs?.getString('role') == 'user') {
                                    // print(await getRole());

                                    // Check if image is picked
                                    if (registerCubit.imagePicked == null) {
                                      appToast(context, "Please pick an image");
                                      return;
                                    }

                                    await registerCubit.makeUserRegister(
                                      FormData.fromMap({
                                        "email": registerCubit.email.text,
                                        "password": registerCubit.password.text,
                                        "lastName": registerCubit.lastName.text,
                                        "firstName":
                                            registerCubit.firstName.text,
                                        "phone": registerCubit.phone.text,
                                        'profileImage':
                                            await MultipartFile.fromFile(
                                          registerCubit.imagePicked!.path,
                                          filename:
                                              registerCubit.imagePicked!.name,
                                        ),
                                      }),
                                      registerCubit.formstate,
                                      context,
                                    );
                                  } else {
                                    AppRouter.router.push(
                                        '${AppRouter.kEnterDataOfExpertRoute}?firstName=${registerCubit.firstName.text}&&lastName=${registerCubit.lastName.text}&&email=${registerCubit.email.text}&&password=${registerCubit.password.text}&&repeatPassword=${registerCubit.repeatPassword.text}&&phone=${registerCubit.phone.text}&&image=${registerCubit.imagePicked!.path}');
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Transform(
                transform: Matrix4.identity()..translate(0.0, -10.h),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                  return ImageInRegister(
                    imagePicked: registerCubit.imagePicked,
                    onTap: () => registerCubit.pickImage(),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
