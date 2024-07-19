import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/search/data/repos/searchRepoImp.dart';
import 'package:servi_connect/Features/search/domain/useCases/searchUseCase.dart';
import 'package:servi_connect/Features/search/presention/mangers/searchCubit.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';

import 'widgets/searchBody.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return SearchCubit(
            SearchUseCase(
              searchRepo: getIt.get<SearchRepoImpl>(),
            ),
          );
        },
        child: const SearchBody(),
      ),
    );
  }
}
