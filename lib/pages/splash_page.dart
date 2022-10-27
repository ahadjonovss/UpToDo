import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/routes/routes.dart';

import '../utils/consts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context,
            RouteName.onboarding, (route) => false));
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 260).r,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                alignment: Alignment.center,
                child: Image.asset(Consts.png_logo),
              ),
              SizedBox(height: 20.h,),
              Text("UpToDo",style: TextStyle(fontSize: 40.sp),)
            ],
          ),
        ),
      )
    );
  }
}
