import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/consts.dart';

Widget auth_with(String img,String what){
  return Container(
      height: 48.h,
      width: 358.w,
      decoration:  BoxDecoration(
        border: Border.all(color: Color(0xFF8687E7)),
        borderRadius: BorderRadius.circular(4).r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 24.h,
            width: 24.w,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(img)
                )
            ),
          ),
          SizedBox(width: 12.w,),
          Text("Login with".tr()+"$what",style: TextStyle(fontSize: 16.sp),)


        ],));
}