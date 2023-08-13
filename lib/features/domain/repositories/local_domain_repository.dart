abstract class LocalServerRepository {
  getData(String key);
  saveData(
      {required bool encoding, required String key, required dynamic data});
}
