import 'package:flutter/material.dart';
import 'package:up_todo/pages/splash_page.dart';

class RouteName{
  static const splash="splsh";
}

class AppRoutes{

  static Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashPage());
      default : return MaterialPageRoute(builder: (_)=> const Scaffold());
    }


  }
}