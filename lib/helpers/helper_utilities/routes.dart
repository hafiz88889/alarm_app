import 'package:flutter/cupertino.dart';

import '../../features/home_screen/home_page.dart';
import '../../features/location_screen/location_set_page.dart';
import '../../features/onboardign_screen/onboarding_page.dart';


class RouteHelper{
  static String onboardingPageOne="/";
  static String locationSetPage="/LocationSetPage";
  static String homePage="/HomePage";



  static Map<String,WidgetBuilder>getRoute(){
    return{
      RouteHelper.onboardingPageOne:(context)=>OnboardingPage(),
      RouteHelper.locationSetPage:(context)=>LocationSetPage(),
      RouteHelper.homePage:(context)=>HomePage(),

    };
  }
}