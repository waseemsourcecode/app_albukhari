//import 'package:flutter/foundation.dart';
import 'package:app_albukhari/features/presentation/cubits/cubit/cubit_home_cubit.dart';
import 'package:app_albukhari/features/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation/pages/routes/page_routes.dart';
import 'features/presentation/theme/appcolors.dart';
import 'injection_container.dart' as di;

//flutter config --no-enable-web
//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitHome>(
          create: (_) => di.sl<CubitHome>()..appStarted(),
        ),
        // BlocProvider<CredentialCubit>(
        //   create: (_) => di.sl<CredentialCubit>(),
        // ),
      ],
      child: MaterialApp(
        title: 'Offset App',
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: fontPopinRegular,
          primarySwatch: buildMaterialColor(AppColors.base),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.red)),
        ),
        initialRoute: '/',
        onGenerateRoute: PageRoutes.route,
        // routerConfig: PageRoutes,
        routes: {
          "/": (context) {
            return const Dashboard(
              title: "Al Bukhari Sharief",
            );
          }
        },
      ),
    );
  }
}
