import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/utils/colors.dart';

Future bottomSheet(BuildContext context, var ctrl_t,ctrl_desc) {
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
                                okButton: Text("Next"),
                                okButtonTextStyle: TextStyle(
                                  color: MyColors.purple,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp
                                )
                              ),
                              dialogSize: const Size(325, 400),
                              borderRadius: BorderRadius.circular(15),
                            );
                          },
                          icon: const Icon(Icons.calendar_month_outlined)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.timer_outlined)),
                      IconButton(
                          onPressed: () {
                            TimePickerDialog(
                              initialTime: TimeOfDay.fromDateTime(
                                  DateTime(28, 10, 2022)),
                            );
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
