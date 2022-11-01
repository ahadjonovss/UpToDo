import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/widgets/task_widget.dart';
import 'package:up_todo/utils/colors.dart';
import 'package:up_todo/utils/consts.dart';

import '../../core/database/database.dart';
import '../../core/models/task_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Task newtask=Task(title: "title", description: "description", category: "category", date: "date", isComplated: 0, priority: 1, time: "time");
  int selected=-1;
  void setstate(int index) {
    setState(() {
      selected=index;
    });
  }


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
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return snapshot.data!.length>0?Container(
              child: Container(
                height: 800.h,
                width: 400.w,
                padding: const EdgeInsets.all(28).r,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) => task(snapshot.data![index]),)
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
      ),
      floatingActionButton: SizedBox(
      height: 70.0.h,
      width: 70.0.w,
      child: FittedBox(
        child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(24).r,
                      color: MyColors.C_979797,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Task',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 12).r,
                                height: 52.h,
                                width: 358.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF979797)),
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: Colors.black54,
                                ),
                                child: TextField(
                                  obscureText: false,
                                  controller: ctrl_bt,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write your task",
                                      hintStyle: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 12).r,
                                width: 358.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF979797)),
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: Colors.black54,
                                ),
                                child: TextField(
                                  maxLines: 5,
                                  obscureText: false,
                                  controller: ctrl_desc,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Description",
                                      hintStyle: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ), //TextFielda
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: ()   async {
                                        var results = await showCalendarDatePicker2Dialog(
                                          context: context,
                                          config: CalendarDatePicker2WithActionButtonsConfig(
                                          ),

                                          dialogSize: const Size(325, 400),
                                          borderRadius: BorderRadius.circular(15),

                                        );
                                        Future.microtask(() => newtask?.date=results.toString().substring(0,10));
                                      },
                                      icon: const Icon(Icons.calendar_month_outlined)),
                                  IconButton(
                                      onPressed: () async{
                                        var time= await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );
                                        Future.microtask(() => newtask?.time=time.toString().substring(0,10));
                                      }, icon: const Icon(Icons.timer_outlined)),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: MyColors.C_363636,
                                                content: SizedBox(
                                                  height: 320.h,
                                                  child: Column(
                                                    children: [
                                                      const Text("Task Priority",textAlign: TextAlign.center,),
                                                      SizedBox(height: 8.h,),
                                                      const Divider(color: Colors.white,),
                                                      SizedBox(height: 12.h,),
                                                      SizedBox(
                                                        height: 200.h,
                                                        width: 330.w,
                                                        child: GridView.builder(
                                                          itemCount: 10,
                                                          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 4,
                                                              crossAxisSpacing: 12,
                                                              mainAxisSpacing: 12
                                                          ),
                                                          itemBuilder: (context, index) {
                                                            return InkWell(
                                                              onTap: (){
                                                                setstate(index);
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: (selected==index)==true?MyColors.C_8687E7:MyColors.C_272727,
                                                                    borderRadius: BorderRadius.circular(4).r
                                                                ),
                                                                height: 64.h,
                                                                width: 64.w,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 24.h,
                                                                      width: 24.w,
                                                                      decoration:   const BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: AssetImage(Consts.icn_flag),
                                                                              fit: BoxFit.cover
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Text("${index+1}")
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },),
                                                      ),
                                                      SizedBox(height: 12.h,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          TextButton(onPressed: (){
                                                            selected=-1;
                                                            Navigator.pop(context);
                                                          },
                                                              child:Text("Cancel",style: TextStyle(color: MyColors.C_8687E7,fontSize: 18.sp),) ),
                                                          InkWell(
                                                            onTap: (){
                                                              newtask.priority=selected+1;
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48.h,
                                                              width: 120.w,
                                                              decoration: BoxDecoration(
                                                                  color: MyColors.C_8687E7,
                                                                  borderRadius: BorderRadius.circular(4).r
                                                              ),
                                                              child: Center(child: Text("Save",style: TextStyle(fontSize: 18.sp),)),
                                                            ),
                                                          )
                                                        ],
                                                      )

                                                    ],
                                                  ),
                                                ),

                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.flag)),
                                ],
                              ),
                              IconButton(onPressed: () async {
                                newtask.title=ctrl_bt.text;
                                newtask.description=ctrl_desc.text;
                                newtask.category='University';
                                newtask.isComplated=0;

                                await LocalDatabase.insertToDatabase(newtask);
                                Navigator.pop(context);
                                setState(() {
                                });

                              }, icon: const Icon(Icons.send)),
                            ],
                          )
                        ],
                      ),
                    );
                  });
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

