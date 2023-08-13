import '../../domain/repositories/local_domain_repository.dart';

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
}
