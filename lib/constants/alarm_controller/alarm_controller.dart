
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;

class AlarmController extends GetxController {
  var alarms = <Map<String, dynamic>>[].obs;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initNotifications();
  }
  void _initNotifications() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void addAlarm(DateTime dateTime) {
    alarms.add({
      "time": DateFormat("h:mm a").format(dateTime),
      "date": DateFormat("EEE dd MMM yyyy").format(dateTime),
      "enabled": true,
    });
  }

  void toggleAlarm(int index, bool value) {
    alarms[index]["enabled"] = value;
    alarms.refresh();
  }

}
