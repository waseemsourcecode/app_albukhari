import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:app_albukhari/features/presentation/cubits/library/cubit_library.dart';
import 'package:app_albukhari/features/presentation/cubits/library/state_library.dart';
import 'package:app_albukhari/features/presentation/widget/hadit_card_type_b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import '../../../../core/display.dart';
import '../../../../core/global_funcs.dart';
import '../../widget/title_text.dart';
import '../bookview/bookview.dart';

class Library extends StatelessWidget   {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitLibrary, StateLibrary>(
      builder: (context, state) {
    //     if          (state is StateLibraryLoaded) {
    // return showBookListView(context, state.books!);
    // }
    //     if (state is StateLibraryActivePageView) {
    //   return  HadithCardTypeB(hadits:  state.hadiths!);
    // }



        return  WillPopScope(
            onWillPop: ()async {
              if(state is StateLibraryActivePageView){
                BlocProvider.of<CubitLibrary>(context).onStarted();
                return false;
              }
              return true;
            },
             child:  (state is StateLibraryLoaded)?  showBookListView(context, state.books!):
             (state is StateLibraryActivePageView)? HadithCardTypeB(hadits:  state.hadiths!): Container()





    );
  });
  }

  Widget showBookListView(BuildContext context, List<Book> books) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          books.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  final hdts = books[index].hadiths;
                  // goToBasicHaditPage(context, books[index]);
                  BlocProvider.of<CubitLibrary>(context).showPagesView(     hadiths: hdts);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Center(child: TitleText(text: books[index].name!)),
                ),
              ),
            );
          },
        ));
  }

  void goToBasicHaditPage(BuildContext context, Book book) {

   DisplaySnackBar.show(context, "Done");
    //  DataProcess.getHaditsFromTheBook(book.)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookView(hadits: book.hadiths,bookName:book.name ?? "Book Name Not found.")));
  }


}
