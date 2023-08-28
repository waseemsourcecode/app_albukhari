import 'dart:convert';
import 'package:app_albukhari/core/global_funcs.dart';
import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:hive/hive.dart';
import '../../domain/usecases/usecase_bookmark.dart';
import 'local_data_source.dart';

// enum LocalSavingKeys { userCredentials, sessionToken, userID, email, country }

class LocalSavingKeys {
  static const hadits = "hadits";
  static const sessionToken = "sessionToken";
  static const userID = "userID";
  static const email = "email";
  static const country = "country";
  static const profile = "profile";

  static const baseLocationID = "baseLocationID";
  //  , , ,
}

class LocalServerDataSourceImpl implements LocalServerDataSource {
//::::::::USE CASE USED ID SharedPrefUseCase

//Here we will deal with outisde world
  //final SharedPreferences localDataBase;
  late final Box box;

  LocalServerDataSourceImpl({required this.box});

  @override
  getData(String key) {
    try {
      return box.get(key);
    } catch (e) {
      printAtConsole("Error getting $e");
      return null;
    }
  }

  @override
  saveData(bool encoding, data, String key) {
    try {
      // box.delete(LocalSavingKeys.hadits);
      if (key == LocalSavingKeys.hadits) {
        final dT = data as Hadith;
        final raw = dT.info;

        const start = "Number";
        // const end = "Number";

        final startIndex = raw!.indexOf(start);
        // final endIndex = raw!.indexOf(end, startIndex + start.length);
        final id = raw
            .substring(startIndex + start.length, raw.length)
            .trim()
            .replaceAll(" ", "")
            .replaceAll(":", "");

        final encoded = json.encode(dT);
        final preData = box.get(LocalSavingKeys.hadits);
        if (preData == null) {
          box.put(key, [
            {id: encoded}
          ]);
        } else {
          final firstLayer = preData as List;
          bool haditAlreadyAdded = false;
          for (Map<dynamic, dynamic> element in firstLayer) {
            if (element.containsKey(id)) {
              haditAlreadyAdded = true;
              break;
            }
          }
          if (!haditAlreadyAdded) {
            firstLayer.add({id: encoded});
            box.put(key, firstLayer);
          }
        }
        toast("hadit saved.");
        printAtConsole("hadit saved.");
      }
    } catch (e) {
      printAtConsole(e);
    }
  }

  @override
  List<BookMarkModel>? getBookmarkedHadithData() {
    final haditsData = getData(LocalSavingKeys.hadits);
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
  }

}