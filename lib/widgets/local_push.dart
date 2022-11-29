
import 'package:flutter/material.dart';
import 'package:music_app/widgets/practice2.dart';
import 'package:timezone/data/latest.dart' as tz;

class LocalPushNotification extends StatefulWidget {
  static const RouteName="/Local";


  @override
  State<LocalPushNotification> createState() => _LocalPushNotificationState();
}

class _LocalPushNotificationState extends State<LocalPushNotification> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  NotificationWidget.init();
    tz.initializeTimeZones();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(

onTap: (){
  NotificationWidget.showNotification(title: "Notification", body: "this is testing");
},          child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      "press button"
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  NotificationWidget.showScheduleNotification(title: "Notification", body: "this is testing", scheduleTime: DateTime.now().add(Duration(seconds: 5)));
                },          child: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
                child: Center(
                  child: Text(
                      "press schedule button"
                  ),
                ),
              ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                NotificationWidget.showScheduleDailyNotification(title: "Notification", body: "this is testing", );
              },          child: Container(
              height: 100,
              width: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                    "press daily notify"
                ),
              ),
            ),
            ),
          ),

        ],
      ),
    );
  }
}
