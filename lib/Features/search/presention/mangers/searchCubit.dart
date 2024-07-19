import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:servi_connect/Features/search/domain/entites/searchEntity.dart';

import 'package:servi_connect/Features/search/domain/useCases/searchUseCase.dart';

part 'searchStates.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  TextEditingController searchController = TextEditingController();

  final SearchUseCase searchUseCase;
  Future<void> makesearch(
      {required String query, required Map<String, dynamic> headers}) async {
    emit(SearchLoading());
    var result = await searchUseCase.call(query, headers);
    result.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (searchs) {
      emit(SearchSuccess(searchs));
    });
  }
}
