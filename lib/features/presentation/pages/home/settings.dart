import 'package:app_albukhari/notifications/notification_service.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _StateSettings();
}

class _StateSettings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(onPressed: (){
        NotificationService().createNotification();
      }, child: Text("Click me")),
    );
  }
}
