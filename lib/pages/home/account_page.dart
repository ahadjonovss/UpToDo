import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/local_data/shared_preference.dart';
import 'package:up_todo/routes/routes.dart';
import 'package:up_todo/utils/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl_name=TextEditingController();
    TextEditingController ctrl_newpsw=TextEditingController();
    TextEditingController ctrl_oldpsw=TextEditingController();
    TextEditingController ctrl_psw=TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24).r,
          width: MediaQuery.of(context).size.width,
          height: 1000.h,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Profile".tr(),style: TextStyle(fontSize: 20.sp),),
                SizedBox(height: 12.h,),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
                  radius: 40.r,
                ),
                SizedBox(height: 4.h,),
                Text(StorageRepository.getString('name'),style: TextStyle(fontSize: 20.sp),),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 64.h,
                      width: 164.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).r,
                        color: MyColors.C_363636,
                      ),
                      child: Center(
                        child: Text("10 task done".tr(),style: TextStyle(fontSize: 16.sp),),
                      ),

                    ),
                    Container(
                      height: 64.h,
                      width: 164.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).r,
                        color: MyColors.C_363636,
                      ),
                      child: Center(
                        child: Text("10 task done".tr(),style: TextStyle(fontSize: 16.sp),),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Settings".tr(),textAlign: TextAlign.start,),
                    SizedBox(height: 12.h,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.settings,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("App settings".tr())
                        ],
                      ),
                      children: [
                        Text("No settings".tr()),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                    Text("Account".tr(),textAlign: TextAlign.start,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.person_outline,color: Colors.white,),
                          SizedBox(width: 20.w,),
                           Text("Change account name".tr())
                        ],
                      ),
                      children: [
                         Text("Change account name".tr()),
                        const Divider(color: Colors.white,),
                        Container(
                          margin: const EdgeInsets.all(12).r,
                          padding: const EdgeInsets.all(4).r,
                          height: 48.h,
                          width: 288.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            border: Border.all(color: MyColors.C_979797)
                            
                          ),
                          child:  Center(
                            child: TextField(
                              controller: ctrl_name,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter your name".tr()
                              ),
                            ),
                          ),
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Cancel".tr())),
                            TextButton(onPressed: () async {
                              await StorageRepository.saveString('name', ctrl_name.text);
                              ctrl_name.text='';
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Save".tr()))
                          ],
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(Icons.key,color: Colors.white,),
                          SizedBox(width: 20.w,),
                           Text("Change account password".tr())
                        ],
                      ),
                      children: [
                        SizedBox(height: 20.w,),
                         Text("Change account password".tr()),
                        const Divider(color: Colors.white,),
                        Container(
                          margin: const EdgeInsets.all(12).r,
                          padding: const EdgeInsets.all(4).r,
                          height: 48.h,
                          width: 288.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4).r,
                              border: Border.all(color: MyColors.C_979797)

                          ),
                          child:  Center(
                            child: TextField(
                              controller: ctrl_oldpsw,
                              decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your old password".tr()
                              ),
                            ),
                          ),

                        ),
                        SizedBox(width: 20.w,),
                        Container(
                          margin: const EdgeInsets.all(12).r,
                          padding: const EdgeInsets.all(4).r,
                          height: 48.h,
                          width: 288.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4).r,
                              border: Border.all(color: MyColors.C_979797)

                          ),
                          child:  Center(
                            child: TextField(
                              controller: ctrl_newpsw,
                              decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your new password".tr()
                              ),
                            ),
                          ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Cancel".tr())),
                            TextButton(onPressed: () async {
                              if(ctrl_oldpsw.text==StorageRepository.getString('password')){
                                await StorageRepository.saveString('password', ctrl_newpsw.text);
                                Navigator.pop(context);
                                Navigator.pushNamed(context, RouteName.account);
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid password!".tr(),style: TextStyle(color: Colors.red),)));
                              }
                            }, child: Text("Save".tr()))
                          ],
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.image,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Change account image".tr())
                        ],
                      ),
                    ),
                    Text("UpTodo".tr(),textAlign: TextAlign.start,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.info_outline,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("About us".tr())
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.question_answer,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("FAQ".tr())
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.live_help,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Help & Feedback".tr())
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.support_agent,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Support US".tr())
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    InkWell(
                      onTap: (){
                        StorageRepository.saveBool('login', false);
                        Navigator.pushNamedAndRemoveUntil(context, RouteName.splash, (route) => false);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 16).r,
                        child: Row(
                          children:  [
                            Icon(Icons.logout_outlined,color: Colors.red,),
                            Text("Log out".tr(),style: TextStyle(color: Colors.red),)
                          ],
                        ),
                      ),
                    )


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
