import 'package:app_albukhari/features/presentation/cubits/library/state_library.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/data_process.dart';
import '../../../domain/models/model_albukhari.dart';
import '../../../domain/usecases/usecase_getbooks.dart';

class CubitLibrary extends Cubit<StateLibrary> {
  final UseCaseGetBooks useCaseGetBooks;

  CubitLibrary({required this.useCaseGetBooks}) : super(StateLibraryInitial());

  Future<void> onStarted() async {
    // emit(StateHomeLoading());
    final books = await DataProcess.getBooksFromTheVolumes();
    //print("Books Data $books");
    emit(StateLibraryLoaded(books: books));
    // setState(() {});
  }

  void showPagesView({required List<Hadith> hadiths}) async {
   // final hadiths = await DataProcess.getHaditsFromTheBook(bookId);
    emit(StateLibraryActivePageView(hadiths:hadiths));
  }
}
