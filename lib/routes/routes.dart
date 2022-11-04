import 'package:flutter/material.dart';
import 'package:up_todo/pages/Auth/login_page.dart';
import 'package:up_todo/pages/Auth/register.dart';
import 'package:up_todo/pages/home/home_page.dart';
import 'package:up_todo/pages/home/main_page.dart';
import 'package:up_todo/pages/onboarding/starting_page.dart';
import 'package:up_todo/pages/onboarding/onboarding.dart';
import 'package:up_todo/pages/splash_page.dart';

class RouteName{
  static const splash="splsh";
  static const onboarding="onb";
  static const start="str";
  static const login="lgn";
  static const register="rgsts";
  static const home="home";
  static const main="main";
}

class AppRoutes{

  static Route generateRoute(RouteSettings settings){
    dynamic args=settings.arguments;

    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashPage());
      case RouteName.main:
        return MaterialPageRoute(builder: (_)=>  MainPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_)=>  HomePage());
      case RouteName.register:
        return MaterialPageRoute(builder: (_)=> const RegisterPage());
      case RouteName.login:
        return MaterialPageRoute(builder: (_)=> const LoginPage());
      case RouteName.onboarding:
        return MaterialPageRoute(builder: (_)=> const OnboardingPage());
      case RouteName.start:
        return MaterialPageRoute(builder: (_)=> const StartPage());
      default : return MaterialPageRoute(builder: (_)=> const Scaffold());
    }


  }
}