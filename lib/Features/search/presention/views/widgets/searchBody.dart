import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/search/presention/mangers/searchCubit.dart';
import 'package:servi_connect/Features/search/presention/views/widgets/shimmerForResultSearchPart.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/functions/validatore.dart';
import '../../../../Auth/presentation/views/widgets/authTextField.dart';
import 'buttonsInSearchScreen.dart';
import 'resultSearchPart.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    TextEditingController name = TextEditingController();
    return SafeArea(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Search',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // const ButtonsInSearchScreen(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: AuthTextField(
                  controller: searchCubit.searchController,
                  label: 'search..',
                  preIcon: null,
                  obscureText: false,
                  suffixIcon: Icons.search,
                  suffixIconOnPressed: () {
                    searchCubit.makesearch(
                        query: searchCubit.searchController.text,
                        headers: {
                          'token':
                              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
                        });
                  },
                ),
              ),
              BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
                if (state is SearchLoading) {
                  return const ShimmerForResultSearchPart();
                } else if (state is SearchFailure) {
                  return const SizedBox();
                } else if (state is SearchSuccess) {
                  return ResultSearchPart(data: state.searchs);
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
