import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/consts.dart';
import '../database/database.dart';
import '../models/task_model.dart';

Widget task(BuildContext context ,Task task,){
  TextEditingController ctrl_bt=TextEditingController();
  TextEditingController ctrl_desc=TextEditingController();
  ctrl_bt.text=task.title;
  ctrl_desc.text=task.description;
  int priority=0;
  Task newtask=Task(title: "title", description: "description", category: "category", date: "date", isComplated: 0, priority: 1, time: "time");
  return InkWell(
    onTap: (){
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
                    'Update Task',
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
                                Future.microtask(() => newtask.date=results.toString().substring(10,20));
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                          IconButton(
                              onPressed: () async{
                                var time= await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                Future.microtask(() => newtask.time=time.toString().substring(10,20));
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
                                                  gridDelegate:  const  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      crossAxisSpacing: 12,
                                                      mainAxisSpacing: 12
                                                  ),
                                                  itemBuilder: (context, index1) {
                                                    return InkWell(
                                                      onTap: (){
                                                        priority=index1;
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
                                                      child:Text("Cancel",style: TextStyle(color: MyColors.C_8687E7,fontSize: 18.sp),) ),
                                                  InkWell(
                                                    onTap: (){
                                                      newtask.priority=priority+1;
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

                      }, icon: const Icon(Icons.send)),
                    ],
                  )
                ],
              ),
            );
          });
    },
    child: Container(
      margin: const EdgeInsets.only(top: 16).r,
      padding: const EdgeInsets.all(10).r,
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
                    child: Text(task.date+" | "+task.time,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8).r,
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
                    margin: const EdgeInsets.only(top: 8,left: 8).r,
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
                          decoration: const BoxDecoration(
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
    ),
  );
}