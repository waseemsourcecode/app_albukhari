import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/data_process.dart';
import '../../../domain/models/model_albukhari.dart';
import '../../../domain/usecases/usecase_bookmark.dart';
import '../../theme/appimages.dart';
import 'cubit_slide_page_state.dart';

class CubitSlidePage extends Cubit<CubitSlidePageState> {

  CubitSlidePage( )
      : super(CubitSlidePageInitial());
var currentPage = 0;
  Future<void> onSwipe( ) async {
    currentPage += 1;
    emit(onPageSlide(index: currentPage));

  }




}
