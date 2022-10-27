import 'package:flutter/material.dart';
import 'package:up_todo/pages/onboarding/starting_page.dart';
import 'package:up_todo/pages/onboarding/onboarding.dart';
import 'package:up_todo/pages/splash_page.dart';

class RouteName{
  static const splash="splsh";
  static const onboarding="onb";
  static const start="str";
}

class AppRoutes{

  static Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashPage());
      case RouteName.onboarding:
        return MaterialPageRoute(builder: (_)=> const OnboardingPage());
      case RouteName.start:
        return MaterialPageRoute(builder: (_)=> const StartPage());
      default : return MaterialPageRoute(builder: (_)=> const Scaffold());
    }


  }
}