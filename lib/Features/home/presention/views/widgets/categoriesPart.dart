import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/home/domain/entites/categoryEntity.dart';
import 'package:servi_connect/Features/home/presention/mangers/expertByCatCubit.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/availbleServicesPart.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/categoriesItem.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';

import 'package:servi_connect/Features/home/presention/mangers/categoryCubit.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart(
      {super.key, required this.data, required this.numberOfPressed});
  final List<CategoryEntity> data;
  final int numberOfPressed;

  @override
  Widget build(BuildContext context) {
    final categoryCubit = context.read<CategoryCubit>();
    final expertsByCatCubit = context.read<ExpertsByCatCubit>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 4.w),
          child: Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 2.w),
                child: InkWell(
                  onTap: () {
                    categoryCubit.setNumberAndIdOfPressed(
                        index, data[index].id);
                    expertsByCatCubit.viewExpertsByCat({
                      'token': prefs?.getString('token')
                    }, {
                      'id': categoryCubit.idOfPressed,
                    });
                  },
                  child: CategoriesItem(
                      data: data[index], isPressed: index == numberOfPressed),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
