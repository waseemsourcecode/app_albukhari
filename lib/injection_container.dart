import 'package:app_albukhari/features/domain/usecases/usecase_bookmark.dart';
import 'package:app_albukhari/features/domain/usecases/usecase_get_random_hadits.dart';
import 'package:app_albukhari/features/domain/usecases/usecase_getbooks.dart';
import 'package:app_albukhari/features/presentation/cubits/cubit/cubit_home_cubit.dart';
import 'package:app_albukhari/features/presentation/cubits/dashboard/cubit_dashboard.dart';
import 'package:app_albukhari/features/presentation/cubits/library/cubit_library.dart';
import 'package:app_albukhari/features/presentation/cubits/slide_page/cubit_slide_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get_it/get_it.dart';

import 'features/data/localdata/local_data_source.dart';
import 'features/data/localdata/local_data_source_impl.dart';
import 'features/data/repositories/local_data_repository_impl.dart';
import 'features/domain/repositories/local_domain_repository.dart';

//To know more please visitto information.txt
final sl = GetIt.instance;
Future<void> init() async {
  //::::::::::::::::::::CUBIT REGISTRATION:::::::::::::::::::::::::::::::

  sl.registerFactory<CubitHome>(
      () => CubitHome(userAuthUseCase: sl.call(), usecaseBookMark: sl.call()));
  sl.registerFactory<CubitDashBoard>(
      () => CubitDashBoard(userAuthUseCase: sl.call()));

  sl.registerFactory<CubitLibrary>(
      () => CubitLibrary(useCaseGetBooks: sl.call()));

  sl.registerFactory<CubitSlidePage>(
          () => CubitSlidePage(  ));


//::::::::::::::::::::::::USECASE REGISTRATION::::::::::::::::::

  sl.registerLazySingleton<UseCaseGetRandomHadits>(
      () => UseCaseGetRandomHadits(repoRemote: sl.call()));
  sl.registerLazySingleton<UseCaseBookmark>(
      () => UseCaseBookmark(repoLocal: sl.call()));
  sl.registerLazySingleton<UseCaseGetBooks>(
      () => UseCaseGetBooks(repoRemote: sl.call()));
//::::::::::::::::::::::::DOMAIN LEVEL REPO REGISTRATION::::::::::::::::::
  sl.registerLazySingleton<LocalServerRepository>(
      () => DataLocalRepositoryImpl(localDataSource: sl.call()));
//::::::::::::::::::::::::data LEVEL  REGISTRATION::::::::::::::::::
  sl.registerLazySingleton<LocalServerDataSource>(
      () => LocalServerDataSourceImpl(box: sl.call()));
  // sl.registerLazySingleton<RemoteServerDataSource>(() =>
  //     RemoteServerDataSourceImpl(
  //         httpClient: sl.call(), box: sl.call(), dio: sl.call()));
  //External

  // File path to a file in the current directory
  await Hive.initFlutter();
  // Open the peopleBox
  final box = await Hive.openBox('HADITBox');

  // final http.Client httpClient = http.Client();
  // sl.registerLazySingleton<http.Client>(() => httpClient);

  // final dio = Dio()
  //   ..options.baseUrl = AppConst.baseURL
  //   ..interceptors.add(LogInterceptor())
  //   ..httpClientAdapter = Http2Adapter(
  //       ConnectionManager(idleTimeout: const Duration(seconds: 15)));

  // sl.registerLazySingleton(() => dio);
  //final localDB = await SharedPreferences.getInstance();

  //sl.registerLazySingleton(() => localDB);
  sl.registerLazySingleton(() => box);
}
