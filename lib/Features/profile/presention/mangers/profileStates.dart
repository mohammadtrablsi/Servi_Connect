part of 'profileCubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}

class ProfileSuccess extends ProfileState {
  final ProfileEntity profile;

  ProfileSuccess(this.profile);
}
