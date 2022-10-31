import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/pages/home/home_page.dart';
import 'package:up_todo/utils/colors.dart';

import '../../utils/consts.dart';

Future bottomSheet(BuildContext context, var ctrl_t,ctrl_desc) {

  int selected=-1;
  return showModalBottomSheet(
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
                      controller: ctrl_t,
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
                            Future.microtask(() => print(results));
                          },
                          icon: const Icon(Icons.calendar_month_outlined)),
                      IconButton(
                          onPressed: () async{
                            var time= await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            Future.microtask(() => print(time));
                          }, icon: const Icon(Icons.timer_outlined)),
                      IconButton(
                          onPressed: () async {
                            showDialog(context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: MyColors.C_363636,
                                    content: Container(
                                      height: 320.h,
                                      child: Column(
                                        children: [
                                          Text("Task Priority",textAlign: TextAlign.center,),
                                          SizedBox(height: 8.h,),
                                          Divider(color: Colors.white,),
                                          SizedBox(height: 12.h,),
                                          Container(
                                            height: 200.h,
                                            width: 330.w,
                                            child: GridView.builder(
                                              itemCount: 10,
                                              gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  crossAxisSpacing: 12,
                                                  mainAxisSpacing: 12
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: (){
                                                    selected==index;
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: MyColors.C_272727,
                                                        borderRadius: BorderRadius.circular(4).r
                                                    ),
                                                    height: 65.h,
                                                    width: 64.w,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          height: 24.h,
                                                          width: 24.w,
                                                          decoration:  BoxDecoration(
                                                              color: (selected==index)==true?MyColors.C_8687E7:MyColors.C_272727,
                                                              image: const DecorationImage(
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
                                              TextButton(onPressed: (){},
                                                  child:Text("Cancel",style: TextStyle(color: MyColors.C_8687E7,fontSize: 18.sp),) ),
                                              Container(
                                                height: 48.h,
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                  color: MyColors.C_8687E7,
                                                  borderRadius: BorderRadius.circular(4).r
                                                ),
                                                child: Center(child: Text("Save",style: TextStyle(fontSize: 18.sp),)),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              )
            ],
          ),
        );
      });
}
