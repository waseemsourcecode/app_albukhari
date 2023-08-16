import 'package:app_albukhari/features/data/data_bridging.dart';
import 'package:app_albukhari/features/domain/repositories/local_domain_repository.dart';

class UseCaseGetBooks {
  final LocalServerRepository repoRemote;
  UseCaseGetBooks({required this.repoRemote});
  //this will be called in cubit
  Future<dynamic> getRandomHadits() async {
    return await repoRemote.getData(LocalSavingKeys.hadits);
  }
}
