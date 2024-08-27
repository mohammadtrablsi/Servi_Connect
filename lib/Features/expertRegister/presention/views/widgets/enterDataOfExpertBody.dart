import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/Auth/presentation/views/widgets/authButton.dart';
import 'package:servi_connect/Features/expertRegister/presention/manger/categoryCubit.dart';
import 'package:servi_connect/core/utils/functions/appToast.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/validatore.dart';
import '../../../../Auth/presentation/views/widgets/authTextField.dart';
import '../../manger/expertRegisterCubit.dart';
import 'servicesInEnterDataOfExpert.dart';
import 'shimmerForServicesInEnterDataOfExpert.dart';

class EnterDataOfExpertBody extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String repeatPassword;
  final String phone;
  final image;
  const EnterDataOfExpertBody(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.repeatPassword,
      required this.phone,
      this.image});

  @override
  Widget build(BuildContext context) {
    print(email);
    print(firstName);
    print(lastName);
    print(password);
    print(phone);
    print(image);
    final styleOfLabel =
        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700);
    final expertRegisterCubit = context.read<ExpertRegisterCubit>();
    final categoryCubit = context.read<CategoryCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'choose the servce you offer',
                style: styleOfLabel,
              ),
              SizedBox(
                height: 2.h,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                if (state is CategoryLoading) {
                  return const ShimmerForServicesInEnterDataOfExpert();
                } else if (state is CategoryFailure) {
                  return const Text('error');
                } else if (state is CategorySuccess) {
                  return ServicesInEnterDataOfExpert(data: state.categories);
                } else {
                  return const SizedBox();
                }
              }),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Address',
                style: styleOfLabel,
              ),
              SizedBox(
                height: 1.h,
              ),
              Form(
                key: expertRegisterCubit.formstate,
                child: Column(
                  children: [
                    AuthTextField(
                      controller: expertRegisterCubit.addressController,
                      label: 'enter your address',
                      preIcon: null,
                      vaildator: (val) {
                        return vaildator(val!, 2, 20, 'name');
                      },
                      obscureText: false,
                      suffixIcon: null,
                      suffixIconOnPressed: () {},
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Your Experinece',
                          style: styleOfLabel,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthTextField(
                      minLines: 5,
                      maxLines: 5,
                      controller: expertRegisterCubit.experineceController,
                      label: 'enter your Experinece',
                      preIcon: null,
                      vaildator: (val) {
                        return vaildator(val!, 2, 200, 'name');
                      },
                      obscureText: false,
                      suffixIcon: null,
                      suffixIconOnPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    widget: BlocListener<ExpertRegisterCubit,
                        ExpertRegisterState>(listener: (context, state) {
                      if (state is ExpertRegisterSuccess) {
                        appToast(context, "success");
                        GoRouter.of(context).go(AppRouter.kBottomNavRoute);
                      }
                      if (state is ExpertRegisterFailure) {
                        appToast(context, state.errMessage);
                      }
                    }, child:
                        BlocBuilder<ExpertRegisterCubit, ExpertRegisterState>(
                            builder: (context, state) {
                      if (state is ExpertRegisterLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
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
                    })),
                    radius: 20.sp,
                    paddinghorizontal: 7.h,
                    paddingvertical: 2.h,
                    onpressed: () async {
                      if (image == null) {
                        print("No image picked.");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please pick an image')),
                        );
                        return;
                      }

                      try {
                        // Log file details
                        // print(
                        //     "Image path: ${expertRegisterCubit.listServices}");
                        // print("Image name: ${image.name}");

                        // Create FormData with image
                        FormData formData = FormData.fromMap({
                          "email": email,
                          "firstName": firstName,
                          "lastName": lastName,
                          "password": password,
                          "address": expertRegisterCubit.addressController.text,
                          "experence":
                              expertRegisterCubit.experineceController.text,
                          "category": expertRegisterCubit.listServices,
                          "profileImage": await MultipartFile.fromFile(
                            image.path,
                            filename: image.name,
                            // contentType: MediaType("image", "jpeg"), // Specify content type if needed
                          ),
                        });

                        await expertRegisterCubit.makeExpertRegister(
                          formData,
                          expertRegisterCubit.formstate,
                          context,
                        );
                      } catch (e) {
                        print("Error creating FormData: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to create FormData')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
