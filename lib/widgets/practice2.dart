import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationWidget{
  static const RouteName="/notifi";

  static Future init({bool scheduled= false}) async{
    var initAndroidSettings = AndroidInitializationSettings("Icons.settings");
    final settings= InitializationSettings(android:  initAndroidSettings,);
  await _notification.initialize(settings);
  tz.initializeTimeZones();
  }
static final _notification= FlutterLocalNotificationsPlugin();
static Future showNotification({
  var id=0,
  var title,
  var body,
  var payLoad,
})async =>_notification.show(id, title, body, await notificationDetails());


  static Future showScheduleNotification({
    var id=0,
    var title,
    var body,
    var payLoad,
    required DateTime scheduleTime,
  })async =>_notification.zonedSchedule(id, title, body, tz.TZDateTime.from(scheduleTime, tz.local) , await notificationDetails(), payload: payLoad, androidAllowWhileIdle: true,uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,  );

  static Future showScheduleDailyNotification({
    var id=0,
    var title,
    var body,
    var payLoad,
  })async =>_notification.zonedSchedule(id=0, title, body,
      _scheduledDaily(Time(15,58)) , await notificationDetails(), payload: payLoad, androidAllowWhileIdle: true,uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,matchDateTimeComponents: DateTimeComponents.time );

  static tz.TZDateTime _scheduledDaily(Time time){
    final now= tz.TZDateTime.now(tz.local);
    final scheduledTime=tz.TZDateTime(tz.local, now.year, now.month, now.day, time.hour, time.minute, time.second);
 print("test now time $now");
 print("test schedules time $scheduledTime");

 return scheduledTime.isBefore(now) ? scheduledTime.add(Duration(days: 1)) : scheduledTime;
  }
  
  static notificationDetails() async{
  return NotificationDetails(
    android: AndroidNotificationDetails(
      "channel id 13",
      "channel name",
      importance: Importance.max
    ),

  );
}
}
