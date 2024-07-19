part of 'categoryCubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure(this.errMessage);
}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;

  CategorySuccess(this.categories);
}

class CategoryChange extends CategoryState {}
