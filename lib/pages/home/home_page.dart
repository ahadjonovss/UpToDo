import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
          child: Column(
            children: [
              ExpansionTile(
                  title: Text("Today"),
                children: [
                  FutureBuilder(
                    future: LocalDatabase.getList(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        dynamic data=snapshot.data;
                        return snapshot.data!.length>0?Container(
                          child: Container(
                              height: 600.h,
                              width: 400.w,
                              padding: const EdgeInsets.all(28).r,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) => Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) async {
                                      print(data[index].id);
                                      await LocalDatabase.deleteTaskById(data[index].id);
                                      setState(() {});
                                    },
                                    child: task(context,snapshot.data![index],)),)
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
                        return Container(
                          child: Center(
                            child: Text("Waiting"),
                          ),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
              ExpansionTile(title: Text("Complated"))
            ],
          ),
        ));
  }
}
