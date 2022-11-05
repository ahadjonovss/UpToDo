import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/auth_sm.dart';
import '../../core/widgets/text_field.dart';
import '../../local_data/shared_preference.dart';
import '../../routes/routes.dart';
import '../../utils/consts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usrnm_ctrl=TextEditingController();
  TextEditingController psw_ctrl=TextEditingController();
  TextEditingController c_psw_ctrl=TextEditingController();
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
          physics:const  BouncingScrollPhysics(),
          child: Container(
            margin:const  EdgeInsets.only(top: 12).r,
            padding: const EdgeInsets.all(24).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register",style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                SizedBox(height: 40.h,),
                textField("Username", "Enter Your Username", usrnm_ctrl, false),
                SizedBox(height: 24.h,),
                textField("Password", "• • • • • • • • • • • •", psw_ctrl, true),
                SizedBox(height: 24.h,),
                textField("Confirm Password", "• • • • • • • • • • • •", c_psw_ctrl, true),
                SizedBox(height: 40.h,),
                InkWell(
                  onTap: () async {
                    if((usrnm_ctrl.text.isNotEmpty&&psw_ctrl.text.isNotEmpty && (psw_ctrl.text==c_psw_ctrl.text))==true){
                      await StorageRepository.saveString("name", usrnm_ctrl.text);
                      await StorageRepository.saveString('password', psw_ctrl.text);
                      await StorageRepository.saveBool('login', true);

                      Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false);
                    }
                    if(usrnm_ctrl.text.isNotEmpty && (psw_ctrl.text!=c_psw_ctrl.text)){
                      ScaffoldMessenger.of(context).showSnackBar(const
                      SnackBar(
                          content: Text("The entered passwords are not similar",
                          style: TextStyle(color: Colors.red),
                          ),
                        backgroundColor: Colors.black54,
                        duration: Duration(seconds: 3),

                      ));
                    }
                    if(usrnm_ctrl.text.isEmpty || psw_ctrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text( "${usrnm_ctrl.text.isEmpty==false?"Password":"Username"} not entered!",
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
                    child: Center(child: Text(textAlign: TextAlign.center,"Register",style: TextStyle(fontSize: 20.sp),)),
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
                      const Text("or",style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 4.w,),
                      const SizedBox(
                        width: 160,
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
                SizedBox(height: 34.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.login);
                        },
                        child: Text("Login",style: TextStyle(fontSize: 12.sp),)),

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
