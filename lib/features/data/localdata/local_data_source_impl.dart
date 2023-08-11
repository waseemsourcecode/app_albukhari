import 'package:hive/hive.dart';
import 'local_data_source.dart';

// enum LocalSavingKeys { userCredentials, sessionToken, userID, email, country }

class LocalSavingKeys {
  static const userCredentials = "userCredentials";
  static const sessionToken = "sessionToken";
  static const userID = "userID";
  static const email = "email";
  static const country = "country";
  static const profile = "profile";

  static const baseLocationID = "baseLocationID";
  //  , , ,
}

class LocalServerDataSourceImpl implements LocalServerDataSource {
//::::::::USE CASE USED ID SharedPrefUseCase

//Here we will deal with outisde world
  //final SharedPreferences localDataBase;
  late final Box box;
  LocalServerDataSourceImpl({required this.box});

  @override
  getData(String key) {
    throw UnimplementedError();
  }

  @override
  saveData(String key) {
    throw UnimplementedError();
  }
}
