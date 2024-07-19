part of 'viewUsersChatForexpertCubit.dart';

@immutable
abstract class ViewUsersChatForexpertState {}

class ViewUsersChatForexpertInitial extends ViewUsersChatForexpertState {}

class ViewUsersChatForexpertLoading extends ViewUsersChatForexpertState {}

class ViewUsersChatForexpertFailure extends ViewUsersChatForexpertState {
  final String errMessage;

  ViewUsersChatForexpertFailure(this.errMessage);
}

class ViewUsersChatForexpertSuccess extends ViewUsersChatForexpertState {
  final List<ViewUsersChatForexpertEntity> viewUsersChatForexperts;

  ViewUsersChatForexpertSuccess(this.viewUsersChatForexperts);
}
