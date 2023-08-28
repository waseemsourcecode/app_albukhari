//import 'package:flutter/foundation.dart';
import 'package:app_albukhari/features/presentation/cubits/cubit/cubit_home_cubit.dart';
import 'package:app_albukhari/features/presentation/cubits/dashboard/cubit_dashboard.dart';
import 'package:app_albukhari/features/presentation/cubits/library/cubit_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/cubits/slide_page/cubit_slide_page.dart';
import 'features/presentation/pages/dashboard/dashboard.dart';
import 'features/presentation/pages/routes/page_routes.dart';
import 'features/presentation/theme/appcolors.dart';
import 'injection_container.dart' as di;
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> init() async {

  //Initialization Settings for Android
  // final AndroidInitializationSettings initializationSettingsAndroid =
  // AndroidInitializationSettings('app_icon');

  //Initialization Settings for iOS
  // final IOSInitializationSettings initializationSettingsIOS =
  // IOSInitializationSettings(
  //   requestSoundPermission: false,
  //   requestBadgePermission: false,
  //   requestAlertPermission: false,
  // );

  //InitializationSettings for initializing settings for both platforms (Android & iOS)
  // final InitializationSettings initializationSettings =
  // InitializationSettings(
  //     android: initializationSettingsAndroid,
  //     iOS: null);

  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  // );
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true
        )
      ]
  );
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
        BlocProvider<CubitSlidePage>(
          create: (_) => di.sl<CubitSlidePage>(),
        ),

        BlocProvider<CubitDashBoard>(
          create: (_) => di.sl<CubitDashBoard>(),
        ),
        BlocProvider<CubitLibrary>(
          create: (_) => di.sl<CubitLibrary>()..onStarted(),
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
            return Dashboard();
          }
        },
      ),
    );
  }
}
