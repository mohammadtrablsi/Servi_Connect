part of 'expertRegisterCubit.dart';


abstract class ExpertRegisterState {}

class ExpertRegisterInitial extends ExpertRegisterState {}

class ExpertRegisterLoading extends ExpertRegisterState {}

class ExpertRegisterFailure extends ExpertRegisterState {
  final String errMessage;

  ExpertRegisterFailure(this.errMessage);
}

// class ShowPassword extends ExpertRegisterState {
// }

class ExpertRegisterSuccess extends ExpertRegisterState {}
