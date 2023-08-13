import 'dart:convert';
import 'dart:math';
import 'package:app_albukhari/core/global_funcs.dart';
import 'package:flutter/services.dart';

import '../features/domain/models/model_albukhari.dart';

class DataProcess {
  static const _sourcePath = "assets/raw/sahih_bukhari.json";
  static Future<List<ModelAlBukhariEnglish>?> getFullData() async {
    try {
      final response = await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final List<ModelAlBukhariEnglish> temp = [];
      for (var element in data) {
        // print(element);
        final modelData = ModelAlBukhariEnglish.fromJson(element);
        temp.add(modelData);

        // print(test.name);
      }
      // print(temp);
      return temp;
    } catch (e) {
      printAtConsole(e);
      return null;
    }
  }

  static Future<List<Book>?> getBooksFromTheVolumes() async {
    try {
      final response = await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final List<Book> temp = [];
      for (var element in data) {
        final volume = ModelAlBukhariEnglish.fromJson(element);

        for (var book in volume.books) {
          temp.add(book);
        }

        // print(test.name);
      }
      return temp;
    } catch (e) {
      printAtConsole("Error while processing $e");
      return null;
    }
  }

  static getHaditsFromTheBook(int bookID) async {
    try {
      final response = await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final List<Book> temp = [];
      for (var element in data) {
        final volume = ModelAlBukhariEnglish.fromJson(element);

        for (var book in volume.books) {
          temp.add(book);
        }

        // print(test.name);
      }
      return temp;
    } catch (e) {
      printAtConsole("Error while processing $e");
      return null;
    }
  }

  static Future<String?> getRawData() async {
    try {
      return await rootBundle.loadString(_sourcePath);
    } catch (e) {
      printAtConsole(e);
      return null;
    }
  }

  static Future<List<Hadith>?> get30RandomHadits() async {
    try {
      final response = await getRawData();
      final data = await json.decode(response!) as List;
      // final limit = (screenSize.height * screenSize.width) * 0.02;
      // print(limit);
      final List<Hadith> hadits = [];
      bool reqDone = false;
      for (var element in data) {
        final volume = ModelAlBukhariEnglish.fromJson(element);

        for (var book in volume.books) {
          // final len = book.hadiths.length - 2;
          //  final rand = Random().nextInt(len);
          //  printAtConsole("len ${book.hadiths.length}");
          //  printAtConsole("RAND $rand");
          // if(hadiths)
          final hadit = (book.hadiths.isEmpty)
              ? null
              : book.hadiths[Random().nextInt(book.hadiths.length - 1)];
          if (hadit != null) {
            if (hadit.text!.length < 500 || hadit.text!.length < 100) {
              hadits.add(hadit);
            }
          }

          if (hadits.length == 30) {
            reqDone = true;
            break;
          }
        }
        if (reqDone) {
          break;
        }
        // print(test.name);
      }
      return hadits;
    } catch (e) {
      printAtConsole("Error while processing $e");
      return null;
    }
  }
}
