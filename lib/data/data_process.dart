import 'dart:convert';

import 'package:flutter/services.dart';

import '../model_albukhari.dart';

class DataProcess {
  static const _sourcePath = "assets/raw/sahih_bukhari.json";
  static  Future<List<ModelAlBukhariEnglish>?> getFullData()async{
    try{
    final response =
          await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final  List<ModelAlBukhariEnglish>temp = [];
      for (var element in data) {
       // print(element);
        final modelData = ModelAlBukhariEnglish.fromJson(element);
        temp.add(modelData);
    
       // print(test.name);
      }
     // print(temp);
      return temp;
 
    } catch (e) {
       
       print(e);
       return null;
    }
  }

  static  Future<List<Book>?>  getBooksFromTheVolumes() async{
try {
    final response =
          await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final  List<Book>temp = [];
      for (var element in data) {
        
        final volume = ModelAlBukhariEnglish.fromJson(element);
       
        volume.books.forEach((book) {
          temp.add(book);
        });
    
       // print(test.name);
      }
      return temp;
} catch (e) {
  print("Error while processing $e");
  return null;
}
  }

  static getHaditsFromTheBook(int bookID) async{
    try {
    final response =
          await rootBundle.loadString(_sourcePath);
      final data = await json.decode(response) as List;
      // print(data);
      final  List<Book>temp = [];
      for (var element in data) {
        
        final volume = ModelAlBukhariEnglish.fromJson(element);
       
        volume.books.forEach((book) {
          temp.add(book);
        });
    
       // print(test.name);
      }
      return temp;
} catch (e) {
  print("Error while processing $e");
  return null;
}
  }
}