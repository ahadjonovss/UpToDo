import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/routes/routes.dart';
import 'package:up_todo/utils/colors.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 400.w,
          padding: const EdgeInsets.all(16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h,),
              Text("Welcome to UpToDo",textAlign:TextAlign.center,style: TextStyle(
                  color: Colors.white,fontSize: 32.sp,fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 40.h,),
              Text("Please login to your account or create\nnew account to continue",style: TextStyle(
                color: Colors.white.withOpacity(0.87),fontSize: 16.sp,
              ),textAlign: TextAlign.center,),
              SizedBox(height: 350.h,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.login);
                },
                child: Container(
                  height: 48.h,
                  width: 328.w,
                  decoration:  BoxDecoration(
                    color: MyColors.purple,
                    borderRadius: BorderRadius.circular(4).r,
                  ),
                  child: Center(child: Text(textAlign: TextAlign.center,"Login",style: TextStyle(fontSize: 20.sp),)),
                ),
              ),
              SizedBox(height: 28.h,),
              Container(
                height: 48.h,
                width: 328.w,
                decoration:  BoxDecoration(
                  border: Border.all(color: MyColors.purple),
                  borderRadius: BorderRadius.circular(4).r,
                ),
                child: Center(child: Text(textAlign: TextAlign.center,"Create account",style: TextStyle(fontSize: 20.sp),)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
