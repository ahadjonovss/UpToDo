import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:up_todo/local_data/category_list.dart';
import 'package:up_todo/pages/home/account_page.dart';
import 'package:up_todo/pages/home/home_page.dart';
import 'package:up_todo/utils/colors.dart';
import 'package:up_todo/utils/consts.dart';

import '../../core/database/database.dart';
import '../../core/models/task_model.dart';

class MainPage extends StatefulWidget {
   MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Task newtask=Task(title: "title", description: "description", category: "category", date: "no data", isComplated: 0, priority: 0, time: "no time", id: 0);
  int selected=0;
  int priority=-1;
  void setstate(int index) {
    setState(() {
      selected=index;
    });
  }



  TextEditingController  ctrl_bt=TextEditingController();
  TextEditingController  ctrl_desc=TextEditingController();

  @override
  Widget build(BuildContext context) {
    List <Widget> pages=[
      HomePage(),
      Container(),
      Container(),
      AccountPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Index"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: pages[selected],
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
                            'Add Task'.tr(),
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
                                  decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write your task".tr(),
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
                                  decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Description".tr(),
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
                                        Future.microtask(() => newtask.date=results.toString().substring(1,11));
                                        print(results.toString());
                                      },
                                      icon: const Icon(Icons.calendar_month_outlined)),
                                  IconButton(
                                      onPressed: () async{
                                        var time= await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );
                                        Future.microtask(() => newtask.time=time.toString().substring(10,15));
                                        print(time.toString().substring(10,15));
                                      }, icon: const Icon(Icons.timer_outlined)),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, state) {
                                                  return AlertDialog(
                                                    backgroundColor: MyColors.C_363636,
                                                    content: SizedBox(
                                                      height: 320.h,
                                                      child: Column(
                                                        children: [
                                                           Text("Task Priority".tr(),textAlign: TextAlign.center,),
                                                          SizedBox(height: 8.h,),
                                                          const Divider(color: Colors.white,),
                                                          SizedBox(height: 12.h,),
                                                          SizedBox(
                                                            height: 200.h,
                                                            width: 330.w,
                                                            child: GridView.builder(
                                                              itemCount: 10,
                                                              gridDelegate:  const  SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount: 4,
                                                                  crossAxisSpacing: 12,
                                                                  mainAxisSpacing: 12
                                                              ),
                                                              itemBuilder: (context, index1) {
                                                                return InkWell(
                                                                  onTap: (){
                                                                    state(() {
                                                                      priority=index1;
                                                                    });

                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                        color: (priority==index1)==true?MyColors.C_8687E7:MyColors.C_272727,
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
                                                                        Text("${index1+1}")
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
                                                                priority=-1;
                                                                Navigator.pop(context);
                                                              },
                                                                  child:Text("Cancel".tr(),style: TextStyle(color: MyColors.C_8687E7,fontSize: 18.sp),) ),
                                                              InkWell(
                                                                onTap: (){
                                                                  newtask.priority=priority+1;
                                                                  Navigator.pop(context);
                                                                  state(() {

                                                                  });
                                                                },
                                                                child: Container(
                                                                  height: 48.h,
                                                                  width: 120.w,
                                                                  decoration: BoxDecoration(
                                                                      color: MyColors.C_8687E7,
                                                                      borderRadius: BorderRadius.circular(4).r
                                                                  ),
                                                                  child: Center(child: Text("Save".tr(),style: TextStyle(fontSize: 18.sp),)),
                                                                ),
                                                              )
                                                            ],
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                  );
                                                },
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.flag)),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, state) {
                                                  return AlertDialog(
                                                    backgroundColor: MyColors.C_363636,
                                                    content: SizedBox(
                                                      height: 420.h,
                                                      child: Column(
                                                        children: [
                                                          Text("Choose Category".tr(),textAlign: TextAlign.center,),
                                                          SizedBox(height: 8.h,),
                                                          const Divider(color: Colors.white,),
                                                          SizedBox(height: 12.h,),
                                                          SizedBox(
                                                            height: 353.h,
                                                            width: 350.w,
                                                            child: GridView.builder(
                                                              itemCount: 10,
                                                              gridDelegate:  const  SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount: 3,
                                                                  crossAxisSpacing: 3,
                                                                  mainAxisSpacing: 4
                                                              ),
                                                              itemBuilder: (context, index1) {
                                                                return InkWell(
                                                                  onTap: (){
                                                                    state(() {
                                                                      newtask.category=categories[index1].title;
                                                                      Navigator.pop(context);
                                                                    });

                                                                  },
                                                                  child: Container(
                                                                    height: 90.h,
                                                                    width: 64.w,
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              color: categories[index1].clr,
                                                                              borderRadius: BorderRadius.circular(4).r
                                                                          ),
                                                                          height: 64.h,
                                                                          width: 64.w,
                                                                          child: Center(
                                                                            child: SvgPicture.asset(categories[index1].icon),
                                                                          ),
                                                                        ),
                                                                        SizedBox(height: 4,),
                                                                        Text(categories[index1].title.tr(),style: TextStyle(fontSize: 12.sp),),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },),
                                                          ),
                                                          SizedBox(height: 12.h,),
                                                        ],
                                                      ),
                                                    ),

                                                  );
                                                },
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.label)),
                                ],
                              ),
                              IconButton(onPressed: () async {
                                if(ctrl_desc.text.isNotEmpty &&
                                ctrl_bt.text.isNotEmpty && newtask.category!='category' && newtask.priority!=0)
                                {
                                  print(newtask.category);
                                  print(newtask.priority);
                                  newtask.title=ctrl_bt.text;
                                  newtask.description=ctrl_desc.text;
                                  newtask.isComplated=0;

                                  LocalDatabase.insertToDatabase(newtask);

                                  Navigator.pop(context);
                                  setState(() {
                                    selected=selected;
                                  });

                                  priority=-1;
                                  ctrl_bt.text='';
                                  ctrl_desc.text='';

                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please,fill all fields!".tr())));
                                }

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
        onTap: (index) => setState(() {
          selected=index;
        }),
        backgroundColor: MyColors.C_363636,
        height: 90.h,

        //other params
      ),
    );
  }
}

