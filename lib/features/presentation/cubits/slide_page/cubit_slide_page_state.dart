
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class CubitSlidePageState extends Equatable {
  const CubitSlidePageState();
}

final class CubitSlidePageInitial extends CubitSlidePageState {
  @override
  List<Object?> get props => [];
}

final class onPageSlide extends CubitSlidePageState {
  final   int index;
  const onPageSlide({required this.index});
  @override
  List<Object?> get props => [index];
}

final class StateHomeLoading extends CubitSlidePageState {
  @override
  List<Object?> get props => [];
}
