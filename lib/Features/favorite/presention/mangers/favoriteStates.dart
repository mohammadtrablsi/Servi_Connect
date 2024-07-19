part of 'favoriteCubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String errMessage;

  FavoriteFailure(this.errMessage);
}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteEntity> Favorites;

  FavoriteSuccess(this.Favorites);
}
