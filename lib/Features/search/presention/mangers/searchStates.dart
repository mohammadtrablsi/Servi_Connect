part of 'searchCubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}

class SearchSuccess extends SearchState {
  final List<SearchEntity> searchs;

  SearchSuccess(this.searchs);
}
