import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'cubit_home_state.dart';

class CubitHome extends Cubit<CubitHomeState> {
  final UseCaseGetRandomHadits userAuthUseCase;

  CubitHome({required this.userAuthUseCase}) : super(CubitHomeInitial());

  appStarted() {}
}
