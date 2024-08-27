import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authButton.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authTextField.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/clipPathInAuth.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/appToast.dart';
import '../../../../../core/utils/functions/getRole.dart';
import '../../../../../core/utils/functions/validatore.dart';
import '../../manger/loginCubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return ClipPathInAuth(
      widget: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Welcom back!",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Form(
                  key: loginCubit.formstate,
                  child: Column(
                    children: [
                      AuthTextField(
                        controller: loginCubit.email,
                        label: 'enter your email',
                        preIcon: Icons.email,
                        vaildator: (val) {
                          return vaildator(val!, 2, 20, 'email');
                        },
                        obscureText: false,
                        suffixIcon: null,
                        suffixIconOnPressed: () {},
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                        return AuthTextField(
                          maxLines: 1,
                          controller: loginCubit.password,
                          label: 'enter your password',
                          preIcon: Icons.password,
                          vaildator: (val) {
                            return vaildator(val!, 5, 15, 'password');
                          },
                          obscureText: loginCubit.isPassword,
                          suffixIcon: loginCubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixIconOnPressed: () {
                            loginCubit.revPassword();
                          },
                        );
                      }),
                      SizedBox(
                        height: 7.h,
                      ),
                      AuthButton(
                        widget: BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              appToast(context, 'Registration successful!');
                              GoRouter.of(context)
                                  .go(AppRouter.kBottomNavRoute);
                            } else if (state is LoginFailure) {
                              appToast(context, state.errMessage);
                            }
                          },
                          child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return SizedBox(
                                  height: 3.h,
                                  width: 6.w,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return Text(
                                  "login",
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
                          await loginCubit.makeLogin({
                            "isUser":
                                // ignore: unrelated_type_equality_checks
                                await prefs?.getString('role') == 'user' ? true : false,
                            "email": loginCubit.email.text,
                            "password": loginCubit.password.text
                          }, loginCubit.formstate, context);
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .go(AppRouter.kRegisterRoute);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: kPrimaryColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
