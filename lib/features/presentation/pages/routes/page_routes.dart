import 'package:app_albukhari/features/presentation/pages/dashboard.dart';
import 'package:app_albukhari/features/presentation/pages/routes/page_const.dart';
import 'package:flutter/material.dart';

import '../../../../core/global_funcs.dart';

class PageRoutes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    printAtConsole(settings.name);
    printAtConsole(args);
    switch (settings.name) {
      case PageConst.dashBoard:
        return materialBuilder(
          widget: const Dashboard(
            title: "Dash",
          ),
          routeSettings: settings,
        );

      default:
        return materialBuilder(
          widget: const ErrorPage(),
          routeSettings: settings,
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder(
    {required RouteSettings routeSettings, required Widget widget}) {
  return MaterialPageRoute(settings: routeSettings, builder: (_) => widget);
}
