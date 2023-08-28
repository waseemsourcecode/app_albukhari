import 'dart:convert';
import 'package:app_albukhari/features/data/data_bridging.dart';
import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:app_albukhari/features/presentation/widget/hadit_card.dart';
import '../../../core/global_funcs.dart';
import '../repositories/local_domain_repository.dart';

class UseCaseBookmark {
  final LocalServerRepository repoLocal;
  UseCaseBookmark({required this.repoLocal});

  //this will be called in cubit
  Future<void> bookmark({required Hadith hadit}) async {
    repoLocal.saveData(
        encoding: true, data: hadit, key: LocalSavingKeys.hadits);
  }

  List<BookMarkModel>? getBookmarks() {

    final data =   repoLocal.getBookmarkedHadithData();// .toString();

    data?.forEach((element) {
      printAtConsole("**** LENGTH ${element.data}");
    });
    return data;
    final haditsData = repoLocal.getData(LocalSavingKeys.hadits);
    if (haditsData != null) {
      try {
        final savedHadits = haditsData as List;
        // final firstLayer = preData as List;
        //  printAtConsole(savedHadits);
        List<BookMarkModel> bookmarks = [];
        for (Map<dynamic, dynamic> element in savedHadits) {
          final okData = json.decode(element.values.first);
          final parsed = Hadith.fromJson(okData);
          var obj = BookMarkModel(id: element.keys.first, data: parsed);
          bookmarks.add(obj);
        }
        //  printAtConsole(bookmarks.length);
        return bookmarks;
      } catch (e) {
        printAtConsole(e);
        return null;
      }
    }
    return null;
  }

  List<ModelHadithData>? syncHadithsWithBookmark(List<Hadith>? hadiths) {
    final data = repoLocal.getBookmarkedHadithData();
      try {
        final List<ModelHadithData> bookmarkedData = [];
        hadiths?.forEach((element) {
          if (data != null) {
            if (data!.contains(element.info)) {
              var obj = ModelHadithData(bookmarked: true, hadith: element);
              bookmarkedData.add(obj);
            } else {
              var obj = ModelHadithData(bookmarked: false, hadith: element);
              bookmarkedData.add(obj);
            }
          }else {
            var obj = ModelHadithData(bookmarked: false, hadith: element);
            bookmarkedData.add(obj);
          }
        });
        return bookmarkedData;
      }catch(e){
        printAtConsole(e);
        return null;
      }

  }
}

class BookMarkModel {
  BookMarkModel({required this.id, required this.data});
  final String id;
  final Hadith data;
}
