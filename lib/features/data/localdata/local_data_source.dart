//CONTRACT CLASS

//Interface

abstract class LocalServerDataSource {
  getData(String key);
  saveData(bool encoding, data, String key);
}
