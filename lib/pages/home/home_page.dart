import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/widgets/text_field.dart';
import 'package:up_todo/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ctrl_bt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Index"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SafeArea(
        child: Container(
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
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: ""),
            BottomNavigationBarItem(icon: Icon(null), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
           context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(24).r,
                  color: Colors.black54,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add Task',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.sp),),
                    SizedBox(height: 8.h,),
                    Container(
                      padding: EdgeInsets.only(left: 12).r,
                      height: 52.h,
                      width: 358.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF979797)),
                          borderRadius: BorderRadius.circular(4).r,
                          color:  Colors.black54,

                      ),
                      child: TextField(
                        obscureText: false,
                        controller: ctrl_bt,
                        decoration:  const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Write your task",
                            hintStyle: const TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      padding: EdgeInsets.only(left: 12).r,
                      height: 52.h,
                      width: 358.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF979797)),
                        borderRadius: BorderRadius.circular(4).r,
                        color:  Colors.black54,

                      ),
                      child: TextField(
                        obscureText: false,
                        controller: ctrl_bt,
                        decoration:  const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Description",
                            hintStyle: const TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  var results = await showCalendarDatePicker2Dialog(
                                    context: context,
                                    config: CalendarDatePicker2WithActionButtonsConfig(),
                                    dialogSize: const Size(325, 400),
                                    initialValue: List.empty(),
                                    borderRadius: BorderRadius.circular(15),
                                  );
                                  print(results);
                                },
                                icon: Icon(Icons.calendar_month_outlined)),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.timer_outlined)),
                            IconButton(
                                onPressed: (){
                                  TimePickerDialog(initialTime: TimeOfDay.fromDateTime(DateTime(28,10,2022)),
                                  );
                                },
                                icon: Icon(Icons.flag)),
                          ],
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.send)),
                      ],
                    )
                  ],
                  ),

                );
              });
        },
        child: Stack(children: [
          Positioned(
            bottom: 34,
            left: 155.9,
            child: Container(
              width: 90,
              height: 45.5,
              decoration: BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(76, 80),
                      bottomRight: Radius.elliptical(76, 80))),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 165,
            child: Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
