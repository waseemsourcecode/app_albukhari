import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:app_albukhari/features/presentation/cubits/dashboard/state_dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//RESPONSIBLE FOR CONTROLLING DASHBOARD FUNCTIONALITY
class CubitDashBoard extends Cubit<StateDB> {
  final UseCaseGetRandomHadits userAuthUseCase;

  CubitDashBoard({required this.userAuthUseCase})
      : super(StateDashBoardInitial());

  void onClickBottomMenuItem({required int index}) {
    emit(StateDBBottomMenuTapped(menuIndex: index));
  }

  void updateBottomMenuSelection({required int selected}) {
    emit(StateDBSelectionIconUpdation(selected: selected));
  }
}
