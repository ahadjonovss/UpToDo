import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/widgets/auth_sm.dart';
import 'package:up_todo/core/widgets/text_field.dart';
import 'package:up_todo/routes/routes.dart';
import 'package:up_todo/utils/consts.dart';

import '../../local_data/shared_preference.dart';
import '../../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usrnm_ctrl=TextEditingController();
  TextEditingController psw_ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin:const  EdgeInsets.only(top: 12).r,
            padding: const EdgeInsets.all(24).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login".tr(),style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                SizedBox(height: 52.h,),
                textField("Username".tr(), "Enter Your Username".tr(), usrnm_ctrl, false),
                SizedBox(height: 24.h,),
                textField("Password".tr(), "• • • • • • • • • • • •", psw_ctrl, true),
                SizedBox(height: 70.h,),
                InkWell(
                  onTap: () async {
                    if((usrnm_ctrl.text.isNotEmpty&&psw_ctrl.text.isNotEmpty)==true){
                      await StorageRepository.saveString("name", usrnm_ctrl.text);
                      await StorageRepository.saveString('password', psw_ctrl.text);
                      await StorageRepository.saveBool('login', true);
                      Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false);
                    }
                    if(usrnm_ctrl.text.isEmpty || psw_ctrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text( "${usrnm_ctrl.text.isEmpty==false?"Password".tr():"Username".tr()} not entered!",
                              style: TextStyle(color: Colors.red),
                            ),
                            backgroundColor: Colors.black54,
                            duration: Duration(seconds: 3),
                          ));
                    }

                  },
                  child: Container(
                    height: 48.h,
                    width: 358.w,
                    decoration:  BoxDecoration(
                      color: const Color(0xFF8687E7),
                      borderRadius: BorderRadius.circular(4).r,
                    ),
                    child: Center(child: Text(textAlign: TextAlign.center,"Login".tr(),style: TextStyle(fontSize: 20.sp),)),
                  ),
                ), //Login
                const SizedBox(height: 32,),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 160,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 4.w,),
                       Text("or".tr(),style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 4.w,),
                      const SizedBox(
                        width: 150,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h,),
                auth_with(Consts.png_google, "Google"),
                SizedBox(height: 20.h,),
                auth_with(Consts.png_apple, "Apple"),
                SizedBox(height: 70.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?".tr(),style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.register);
                      },
                        child: Text("Register".tr(),style: TextStyle(fontSize: 12.sp),)),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
