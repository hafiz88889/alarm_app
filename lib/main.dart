import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:onboarding_task_app/helpers/helper_utilities/routes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Onboarding App",
      initialRoute: RouteHelper.onboardingPageOne,
      routes: RouteHelper.getRoute(),
    );
  }
}
