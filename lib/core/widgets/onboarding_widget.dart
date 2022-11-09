import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../utils/consts.dart';

Widget onboarding_wdj(String lottie,int ind,String title,String subtitle){
  return Container(
    height: ind==1?500.h:600.h,
    child: Column(
      children: [
        Container(
          height: ind==1?200.h:300.h,
          margin: const EdgeInsets.only(top: 90).r,
          child: Lottie.asset(lottie),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40).r,
          width: 400.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4.h,
                width: 36.w,
                decoration: BoxDecoration(
                    color: ind==1?Colors.white:Colors.grey,
                    borderRadius: BorderRadius.circular(4).r
                ),
              ),
              SizedBox(width: 8.w,),
              Container(
                height: 4.h,
                width: 36.w,
                decoration: BoxDecoration(
                    color: ind==2?Colors.white:Colors.grey,
                    borderRadius: BorderRadius.circular(4).r
                ),
              ),
              SizedBox(width: 8.w,),
              Container(
                height: 4.h,
                width: 36.w,
                decoration: BoxDecoration(
                    color: ind==3?Colors.white:Colors.grey,
                    borderRadius: BorderRadius.circular(4).r
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 40.h,),
        Text(title.tr(),style: TextStyle(
            color: Colors.white,fontSize: 32.sp,fontWeight: FontWeight.w600
        ),),
        SizedBox(height: 30.h,),
        Text(subtitle.tr(),style: TextStyle(
          color: Colors.white.withOpacity(0.87),fontSize: 16.sp,
        ),textAlign: TextAlign.center,)
      ],
    ),
  );
}


List<Widget> onboardings=[
  onboarding_wdj(
      Consts.lt_onb1, 1,
      "Manage your tasks".tr(),
      "You can easily manage all of your daily"
          "\ntasks in DoMe for free".tr()),
  onboarding_wdj(
      Consts.lt_onb2, 2,
      "Create daily routine".tr(),
      "In Uptodo  you can create your\n"
          "personalized routine to stay productive".tr()),
  onboarding_wdj(
      Consts.lt_onb3, 3,
      "Orgonaize your tasks".tr(),
      "You can organize your daily tasks by\n"
          "adding your tasks into separate categories".tr()),
];
