import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/data_process.dart';
import '../../../domain/models/model_albukhari.dart';
import '../../../domain/usecases/usecase_bookmark.dart';
import 'cubit_home_state.dart';

class CubitHome extends Cubit<CubitHomeState> {
  final UseCaseGetRandomHadits userAuthUseCase;
  final UseCaseBookmark usecaseBookMark;

  CubitHome({required this.userAuthUseCase, required this.usecaseBookMark})
      : super(CubitHomeInitial());

  Future<void> appStarted() async {
    // emit(StateHomeLoading());
    final hadits = await DataProcess.get30RandomHadits();
    //print("Books Data $books");
    emit(CubitHomeStateStarted(hadits: hadits));
    // setState(() {});
  }

  void bookmarkHadit(Hadith hadit) {
    usecaseBookMark.bookmark(hadit: hadit);
  }

  List<BookMarkModel>? getBookmarks() {
    return usecaseBookMark.getBookmarks();
  }
}
