import 'package:app_albukhari/features/domain/models/model_albukhari.dart';

import '../usecases/usecase_bookmark.dart';

abstract class LocalServerRepository {
  getData(String key);
  saveData(
      {required bool encoding, required String key, required dynamic data});

 List<BookMarkModel>? getBookmarkedHadithData();
}
