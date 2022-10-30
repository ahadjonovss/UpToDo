import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/consts.dart';

Widget btm_bar(String icn){
  return Container(
    height: 24.h,
    width: 24.w,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(icn),
            fit: BoxFit.cover
        )
    ),
  );
}