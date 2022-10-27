import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/widgets/onboarding_widget.dart';
import 'package:up_todo/routes/routes.dart';
import 'package:up_todo/utils/colors.dart';

import '../../utils/consts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController=PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const  EdgeInsets.only(left: 16,top: 16,right: 16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteName.start);
                  },
                  child: Text("Skip",
                    style: TextStyle(fontSize:20.sp,
                        color: Colors.white.withOpacity(0.44)),)), //Skip
              SizedBox(
                  height: 600.h,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) => onboardings[currentPage],
                    controller: pageController,
                    onPageChanged: (val){
                      currentPage=val;
                      setState(() {});
                    },
                    physics: const BouncingScrollPhysics(),

                  )) ,//Onboarding
              SizedBox(height: 60.h,),
              SizedBox(
                width: 400.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      if(currentPage!=0){
                        pageController.animateToPage(currentPage-1, duration: Duration(milliseconds: 600), curve: Curves.ease);
                      }
                    },
                        child: Text("Back",style:
                        TextStyle(color: Colors.white.withOpacity(0.44),
                          fontSize: 20.sp
                        ),)) ,// Back
                    InkWell(
                      onTap: (){
                        if(currentPage!=2){
                          pageController.animateToPage(currentPage+1, duration: const  Duration(milliseconds: 600), curve: Curves.ease);
                        }
                        if(currentPage==2){
                          Navigator.pushNamed(context, RouteName.start);
                        }
                      },
                      child: Container(
                        height: 48.h,
                        width: currentPage!=2?90.w:150.w,
                        decoration:  BoxDecoration(
                          color: MyColors.purple,
                          borderRadius: BorderRadius.circular(4).r
                        ),
                        child: Center(
                          child: Text(currentPage!=2?"Next":"Get Started",style: TextStyle(fontSize: 16.sp),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
