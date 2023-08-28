import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  void createNotification() async {
    String timezom = await AwesomeNotifications()
        .getLocalTimeZoneIdentifier(); //get time zone you are in
    final data = notifyData();
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: data["title"],
            body: data['body']),
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(seconds: 10)))
      //  schedule:   NotificationInterval(interval: 60,timeZone: timezom,repeats: true)
        );

  }
void schedule2(){
  final data = notifyData();
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 2,
          channelKey: 'key2',
          title: data["title"],
          body: data['body']),
      schedule: NotificationCalendar.fromDate(
          date: DateTime.now().add(const Duration(seconds: 10)))
    //  schedule:   NotificationInterval(interval: 2,timeZone: timezom,repeats: true)
  );
}
  Map<String, String> notifyData() {
    final titlesData = [
      {
        "title": "Prophet remember his umma more.",
        "body":
            "Indeed there is a blessing in the saying of your Prophet Muhammad"
      },
      {
        "title": "Devil makes people ignore",
        "body": "Crush his way by reading one hadith"
      },
      {
        "title": "Here is your today's bless words",
        "body": "Just read a single hadith and get reward"
      },
      {
        "title": "We are not forever on earth!",
        "body": "Here is a time to get reward of Akhira"
      }
      ,
      {
        "title": "Generate some deeds for your loved once!",
        "body": "Read some hadiths with the intention of deeds for your loved once who passed away."
      }
    ];
    return titlesData[Random().nextInt(titlesData.length - 1)];
  }
}
