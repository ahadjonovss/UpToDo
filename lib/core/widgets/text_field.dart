import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textField(String text, String hint,TextEditingController ctrl,bool obs){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),),
      SizedBox(height: 8.h,),
      Container(
        padding: EdgeInsets.only(left: 12).r,
        height: 48.h,
        width: 358.w,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF979797)),
            borderRadius: BorderRadius.circular(4).r,
            color: const Color(0xFF1D1D1D)

        ),
        child: TextField(
          obscureText: obs,
          controller: ctrl,
          decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF535353))
          ),
        ),
      )
    ],
  );
}