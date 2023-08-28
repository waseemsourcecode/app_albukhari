
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class CubitBookmarkState extends Equatable {
  const CubitBookmarkState();
}

final class CubitHomeInitial extends CubitBookmarkState {
  @override
  List<Object?> get props => [];
}

final class BookmarkStateflipCard extends CubitBookmarkState {
  final Image sticker;
  const BookmarkStateflipCard({required this.sticker});
  @override
  List<Object?> get props => [sticker];
}

final class StateHomeLoading extends CubitBookmarkState {
  @override
  List<Object?> get props => [];
}
