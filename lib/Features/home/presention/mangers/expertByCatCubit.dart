import 'package:bloc/bloc.dart';
import 'package:servi_connect/Features/home/domain/entites/expertsByCatEntity.dart';



import 'package:servi_connect/Features/home/domain/useCases/ExpertsByCatUseCase.dart';




part 'expertByCatStates.dart';


class ExpertsByCatCubit extends Cubit<ExpertsByCatState> {
  ExpertsByCatCubit(this.expertsByCatUseCase) : super(ExpertsByCatInitial());

  final ExpertsByCatUseCase expertsByCatUseCase;
  Future<void> viewExpertsByCat(Map<String,dynamic>headers,Map<String,dynamic>data) async {
    emit(ExpertsByCatLoading());
    var result = await expertsByCatUseCase.call(headers: headers,data: data);
    result.fold((failure) {
      emit(ExpertsByCatFailure(failure.message));
    }, (expertsByCat) {
      emit(ExpertsByCatSuccess(expertsByCat));
    });
  }
}
