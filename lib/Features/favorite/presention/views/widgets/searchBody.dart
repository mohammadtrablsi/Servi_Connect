import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/search/presention/mangers/searchCubit.dart';
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
      child: Column(
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
          const ButtonsInSearchScreen(),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:4.w),
            child: AuthTextField(
              controller: name,
              label: 'search..',
              preIcon: Icons.search,
              obscureText: false,
              suffixIcon: null,
              suffixIconOnPressed: () {},
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            if (state is SearchLoading) {
              return const CircularProgressIndicator();
            } else if (state is SearchFailure) {
              return const Text('error');
            } else if (state is SearchSuccess) {
              return ResultSearchPart(data: state.searchs);
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
