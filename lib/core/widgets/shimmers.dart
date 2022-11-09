import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class TaskShimmer extends StatefulWidget {
  const TaskShimmer({Key? key}) : super(key: key);

  @override
  State<TaskShimmer> createState() => _TaskShimmerState();
}

class _TaskShimmerState extends State<TaskShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      child:
      ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
          itemBuilder:(context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 16).r,
              padding: const EdgeInsets.all(10).r,
              height: 80.h,
              width: 340.w,
              decoration: BoxDecoration(
                  color: MyColors.C_363636,
                  borderRadius: BorderRadius.circular(4).r
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration:const  BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      width: 20.w,
                    ),
                  ),
                  SizedBox(width: 12.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 16.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: MyColors.C_363636,
                              borderRadius: BorderRadius.circular(4).r
                          ),
                        ),),
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              color: MyColors.C_363636,
                              borderRadius: BorderRadius.circular(4).r
                          ),
                        ),)
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    margin: EdgeInsets.only(top: 28).r,
                    child: Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 30.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: MyColors.C_363636,
                                borderRadius: BorderRadius.circular(4).r
                            ),
                          ),),
                        SizedBox(width: 12.w,),
                        Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: MyColors.C_363636,
                                borderRadius: BorderRadius.circular(4).r
                            ),
                          ),),

                      ],
                    ),
                  )
                ],
              ),
            );
          }, )
    );
  }
}
