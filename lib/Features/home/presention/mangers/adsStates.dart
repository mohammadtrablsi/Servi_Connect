part of 'adsCubit.dart';

@immutable
abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsFailure extends AdsState {
  final String errMessage;

  AdsFailure(this.errMessage);
}

class AdsSuccess extends AdsState {
  final List<AdsEntity> Ads;

  AdsSuccess(this.Ads);
}
