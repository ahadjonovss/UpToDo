import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/consts.dart';
import '../models/task_model.dart';

Widget task(Task task){
  return Container(
    margin: EdgeInsets.only(top: 16).r,
    padding: EdgeInsets.all(10).r,
    height: 80.h,
    width: 400.w,
    decoration: BoxDecoration(
        color: MyColors.C_363636,
        borderRadius: BorderRadius.circular(4).r
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle
          ),
          width: 20.w,
        ),
        SizedBox(width: 12.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title,style: TextStyle(color: Colors.white,fontSize: 18.sp),),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12).r,
                  width: 140.w,
                  child: Text(task.time,style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8).r,
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: MyColors.C_8687E7,
                    borderRadius: BorderRadius.circular(4).r,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(task.category,style: TextStyle(fontSize: 12.sp),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8,left: 8).r,
                  height: 30.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.C_8687E7,),
                    borderRadius: BorderRadius.circular(4).r,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 14.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Consts.icn_flag),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Text(task.priority.toString(),style: TextStyle(fontSize: 12.sp),),

                    ],
                  ),
                )

              ],
            )

          ],
        )
      ],
    ),
  );
}