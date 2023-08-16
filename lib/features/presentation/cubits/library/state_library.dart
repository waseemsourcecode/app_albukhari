import 'package:equatable/equatable.dart';

import '../../../domain/models/model_albukhari.dart';

abstract class StateLibrary extends Equatable {
  const StateLibrary();
}

final class StateLibraryInitial extends StateLibrary {
  @override
  List<Object?> get props => [];
}

final class StateLibraryLoaded extends StateLibrary {
  final List<Book>? books;
  const StateLibraryLoaded({required this.books});
  @override
  List<Object?> get props => [books];
}

final class StateLibraryLoading extends StateLibrary {
  @override
  List<Object?> get props => [];
}
