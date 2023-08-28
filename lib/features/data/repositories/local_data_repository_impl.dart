import 'package:app_albukhari/features/domain/models/model_albukhari.dart';

import '../../domain/repositories/local_domain_repository.dart';

import '../../domain/usecases/usecase_bookmark.dart';
import '../localdata/local_data_source.dart';

class DataLocalRepositoryImpl implements LocalServerRepository {
  final LocalServerDataSource localDataSource;

  DataLocalRepositoryImpl({required this.localDataSource});

  @override
  getData(String key) {
    return localDataSource.getData(key);
  }

  @override
  saveData({required bool encoding, required String key, required data}) {
    localDataSource.saveData(encoding, data, key);
  }

  @override
  List<BookMarkModel>? getBookmarkedHadithData() {
   return localDataSource.getBookmarkedHadithData();
  }
}
