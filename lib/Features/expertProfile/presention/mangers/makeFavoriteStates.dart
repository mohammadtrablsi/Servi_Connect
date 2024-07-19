part of 'makeFavoriteCubit.dart';

@immutable
abstract class MakeFavoriteState {}

class MakeFavoriteInitial extends MakeFavoriteState {}

class MakeFavoriteLoading extends MakeFavoriteState {}

class MakeFavoriteFailure extends MakeFavoriteState {
  final String errMessage;

  MakeFavoriteFailure(this.errMessage);
}

class MakeFavoriteSuccess extends MakeFavoriteState {
  final MakeFavoriteEntity message;

  MakeFavoriteSuccess(this.message);
}
