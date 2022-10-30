import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/widgets/bottom_nbar_widget.dart';
import 'package:up_todo/core/widgets/bottom_sheet.dart';
import 'package:up_todo/core/widgets/text_field.dart';
import 'package:up_todo/utils/colors.dart';
import 'package:up_todo/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController  ctrl_bt=TextEditingController();
  TextEditingController  ctrl_desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Index"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 54.h,
              ),
              Container(
                alignment: Alignment.center,
                height: 300.h,
                width: 300.w,
                child: Lottie.asset(Consts.lt_onb3),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "What do you want to do today?",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Tap + to add your tasks",
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
      height: 70.0.h,
      width: 70.0.w,
      child: FittedBox(
        child: FloatingActionButton(
            onPressed: () {
              bottomSheet(context, ctrl_bt,ctrl_desc);
            },
          backgroundColor: MyColors.purple,
          child: Text("+",style: TextStyle(color: Colors.white,fontSize: 28.sp,fontWeight: FontWeight.w300),),
        ),
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home,
          Icons.calendar_month,
          Icons.history,
          Icons.person,
        ],
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        gapWidth: 40.w,
        onTap: (index) => setState(() {}),
        backgroundColor: MyColors.C_363636,
        height: 90.h,

        //other params
      ),
    );
  }
}
