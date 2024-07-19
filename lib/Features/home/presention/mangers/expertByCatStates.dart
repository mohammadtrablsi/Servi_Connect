part of 'expertByCatCubit.dart';


abstract class ExpertsByCatState {}

class ExpertsByCatInitial extends ExpertsByCatState {}

class ExpertsByCatLoading extends ExpertsByCatState {}

class ExpertsByCatFailure extends ExpertsByCatState {
  final String errMessage;

  ExpertsByCatFailure(this.errMessage);
}

class ExpertsByCatSuccess extends ExpertsByCatState {
  final List<ExpertsByCatEntity> expertsByCat;

  ExpertsByCatSuccess(this.expertsByCat);
}
