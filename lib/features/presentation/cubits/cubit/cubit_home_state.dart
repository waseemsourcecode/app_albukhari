import 'package:equatable/equatable.dart';

import '../../../domain/models/model_albukhari.dart';

abstract class CubitHomeState extends Equatable {
  const CubitHomeState();
}

final class CubitHomeInitial extends CubitHomeState {
  @override
  List<Object?> get props => [];
}

final class CubitHomeStateStarted extends CubitHomeState {
  final List<Hadith>? hadits;
  const CubitHomeStateStarted({required this.hadits});
  @override
  List<Object?> get props => [hadits];
}

final class StateHomeLoading extends CubitHomeState {
  @override
  List<Object?> get props => [];
}
