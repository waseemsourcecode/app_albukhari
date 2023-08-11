import '../../domain/repositories/local_domain_repository.dart';

import '../localdata/local_data_source.dart';

class DataLocalRepositoryImpl implements LocalServerRepository {
  final LocalServerDataSource localDataSource;

  DataLocalRepositoryImpl({required this.localDataSource});

  @override
  getData(String key) {
    throw UnimplementedError();
  }

  @override
  saveData(String key) {
    throw UnimplementedError();
  }
}
