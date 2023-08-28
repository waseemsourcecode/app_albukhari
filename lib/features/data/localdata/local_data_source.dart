//CONTRACT CLASS

//Interface

import 'package:app_albukhari/features/domain/models/model_albukhari.dart';

import '../../domain/usecases/usecase_bookmark.dart';

abstract class LocalServerDataSource {
  getData(String key);
  saveData(bool encoding, data, String key);

  List<BookMarkModel>? getBookmarkedHadithData();
}
