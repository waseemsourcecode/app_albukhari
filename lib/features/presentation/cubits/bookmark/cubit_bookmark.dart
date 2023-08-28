import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/data_process.dart';
import '../../../domain/models/model_albukhari.dart';
import '../../../domain/usecases/usecase_bookmark.dart';
import '../../theme/appimages.dart';
import 'cubit_bookmark_state.dart';

class CubitBookmark extends Cubit<CubitBookmarkState> {
  final UseCaseGetRandomHadits userAuthUseCase;
  final UseCaseBookmark usecaseBookMark;

  CubitBookmark({required this.userAuthUseCase, required this.usecaseBookMark})
      : super(CubitHomeInitial());

  Future<void> onSwipe(Size size) async {
  final   rImage = AppImages.randomImage(
        (size.width * 0.1), (size.width * 0.1), BoxFit.scaleDown);
    emit(BookmarkStateflipCard(sticker: rImage));

  }

  void bookmarkHadit(Hadith hadit) {
    usecaseBookMark.bookmark(hadit: hadit);
  }

  List<BookMarkModel>? getBookmarks() {
    return usecaseBookMark.getBookmarks();
  }
}
