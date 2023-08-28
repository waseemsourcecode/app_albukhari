import 'package:app_albukhari/core/global_funcs.dart';
import 'package:app_albukhari/features/domain/usecases/usecase_bookmark.dart';
import 'package:app_albukhari/features/presentation/pages/dashboard/dashboard_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/cubit_home_cubit.dart';
import '../boommark/bookmarks.dart';

extension DashboardMethods on DashboardUI{
  void controlPanel() {}

  void moveToBookMark(BuildContext context) {
    final hadithData = BlocProvider.of<CubitHome>(context).getBookmarks();
    if (hadithData != null && hadithData.length > 1) {

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Bookmarks(
            hadits: hadithData,
          )));
    }

  }
}