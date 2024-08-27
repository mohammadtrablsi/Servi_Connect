part of 'getExpertByIdCubit.dart';





@immutable
abstract class GetExpertByIdState {}

class GetExpertByIdInitial extends GetExpertByIdState {}

class GetExpertByIdLoading extends GetExpertByIdState {}

class GetExpertByIdFailure extends GetExpertByIdState {
  final String errMessage;

  GetExpertByIdFailure(this.errMessage);
}

class GetExpertByIdSuccess extends GetExpertByIdState {
  final ExpertProfileEntity data;

  GetExpertByIdSuccess(this.data);
}
