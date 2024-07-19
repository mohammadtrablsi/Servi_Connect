import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/expertRegister/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/expertRegister/presention/manger/expertRegisterCubit.dart';
import 'package:servi_connect/constants.dart';
import 'package:sizer/sizer.dart';

class ServicesInEnterDataOfExpert extends StatefulWidget {
  ServicesInEnterDataOfExpert({super.key, required this.data});
  final List<CategoryEntity> data;

  @override
  State<ServicesInEnterDataOfExpert> createState() =>
      _ServicesInEnterDataOfExpertState();
}

class _ServicesInEnterDataOfExpertState
    extends State<ServicesInEnterDataOfExpert> {
  List<bool>? isWhiteList;

  @override
  void initState() {
    super.initState();
    // Initialize the state list with true values
    isWhiteList = List<bool>.filled(widget.data.length, true);
  }

  @override
  Widget build(BuildContext context) {
    final expertRegisterCubit = context.read<ExpertRegisterCubit>();
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15.sp),
                onTap: () {
                  setState(() {
                    isWhiteList![index] = !isWhiteList![index];
                  });
                  expertRegisterCubit.setInListServices(widget.data[index].id);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.4.h,
                      color: isWhiteList![index]
                          ? kPrimaryColor.withOpacity(0.4)
                          : kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 7.w),
                    child: Text(
                      widget.data[index].name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
