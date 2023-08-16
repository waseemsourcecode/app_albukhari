import 'package:flutter/material.dart';

class EmptyRoom extends StatelessWidget {
  const EmptyRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(AppConst.defaultMessages(DefaultMsg.appName)),
      ),
    );
  }
}

class AppConst {
  static String defaultMessages(DefaultMsg key) {
    switch (key) {
      case DefaultMsg.appName:
        return "Shahi Bukhari Sharief ♥️";
    }
  }
}

enum DefaultMsg { appName }

mixin DefaultMessages on AppConst {
  static const appName = "Shahi Bukhari Sharief";
}
