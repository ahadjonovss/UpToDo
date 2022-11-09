import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/service/get_list.dart';
import 'package:up_todo/core/widgets/shimmers.dart';
import 'package:up_todo/core/widgets/task_widget.dart';
import 'package:up_todo/utils/colors.dart';
import 'package:up_todo/utils/consts.dart';

import '../../core/database/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ctrl_bt=TextEditingController();
  TextEditingController ctrl_desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: 1300.h,
            child: Column(
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                    title: Text("Today".tr()),
                  children: [
                    FutureBuilder(
                      future: LocalDatabase.getTaskIsCompleted(0),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return snapshot.data!.length>0?Container(
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 8).r,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) => Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) async {
                                        await LocalDatabase.updateTaskById(snapshot.data![index].copyWith(isComplated: 1));
                                        setState(() {
                                          getList();
                                        });
                                        print(snapshot.data![index].isComplated);
                                      },
                                      child: snapshot.data![index].isComplated==0?task(context,snapshot.data![index],(){
                                        setState(() {});
                                      }):Container()),)
                            ),
                          ):
                          SafeArea(
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
                                    "What do you want to do today?".tr(),
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "Tap + to add your tasks".tr(),
                                    style: TextStyle(fontSize: 16.sp),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        if(snapshot.hasError){
                          return Container(
                            child: Center(
                              child: Text( snapshot.error.toString()),
                            ),
                          );
                        }
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return TaskShimmer();
                        }
                        return Container();
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text("Completed".tr()),
                  children: [
                    FutureBuilder(
                      future: LocalDatabase.getTaskIsCompleted(1),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return snapshot.data!.length>0?Container(
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 8).r,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) => Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) async {
                                        await LocalDatabase.updateTaskById(snapshot.data![index].copyWith(isComplated: 0));
                                        setState(() {
                                          getList();
                                        });
                                      },
                                      child: snapshot.data![index].isComplated==0?task(context,snapshot.data![index],(){
                                        setState(() {});
                                      }):Container()),)
                            ),
                          ):
                          SafeArea(
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
                                    "What do you want to do today?".tr(),
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "Tap + to add your tasks".tr(),
                                    style: TextStyle(fontSize: 16.sp),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        if(snapshot.hasError){
                          return Container(
                            child: Center(
                              child: Text( snapshot.error.toString()),
                            ),
                          );
                        }
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return TaskShimmer();
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

