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
      child:
      Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.only(top: 16).r,
              padding: const EdgeInsets.all(10).r,
              height: 80.h,
              width: 340.w,
                decoration: BoxDecoration(
                    color: MyColors.C_363636,
                    borderRadius: BorderRadius.circular(4).r
                ),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.C_363636,
                          shape: BoxShape.circle
                      ),
                      width: 20.w,
                    ),
                  )
                ],
              ),
              ),
            ),

        ],
      ),
    );
  }
}
