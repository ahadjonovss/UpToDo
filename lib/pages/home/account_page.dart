import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Text("Profile",style: TextStyle(fontSize: 20.sp),),
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
                        child: Text("10 task done",style: TextStyle(fontSize: 16.sp),),
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
                        child: Text("10 task done",style: TextStyle(fontSize: 16.sp),),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Settings",textAlign: TextAlign.start,),
                    SizedBox(height: 12.h,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.settings,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("App settings")
                        ],
                      ),
                      children: [
                        Text("No settings"),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                    Text("Account",textAlign: TextAlign.start,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.person_outline,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          const Text("Change account name")
                        ],
                      ),
                      children: [
                        const Text("Change account name"),
                        const Divider(color: Colors.white,),
                        Container(
                          margin: EdgeInsets.all(12).r,
                          padding: EdgeInsets.all(4).r,
                          height: 48.h,
                          width: 288.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            border: Border.all(color: MyColors.C_979797)
                            
                          ),
                          child:  Center(
                            child: TextField(
                              controller: ctrl_name,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter your name"
                              ),
                            ),
                          ),
                          
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Cancel")),
                            TextButton(onPressed: () async {
                              await StorageRepository.saveString('name', ctrl_name.text);
                              ctrl_name.text='';
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Save"))
                          ],
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(Icons.key,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          const Text("Change account password")
                        ],
                      ),
                      children: [
                        SizedBox(height: 20.w,),
                        const Text("Change account password"),
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
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your old password"
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
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your new password"
                              ),
                            ),
                          ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RouteName.account);
                            }, child: Text("Cancel")),
                            TextButton(onPressed: () async {
                              if(ctrl_oldpsw.text==StorageRepository.getString('password')){
                                await StorageRepository.saveString('password', ctrl_newpsw.text);
                                Navigator.pop(context);
                                Navigator.pushNamed(context, RouteName.account);
                              }
                            }, child: Text("Save"))
                          ],
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.image,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Change account image")
                        ],
                      ),
                    ),
                    Text("UpTodo",textAlign: TextAlign.start,),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.info_outline,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("About us")
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.question_answer,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("FAQ")
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.live_help,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Help & Feedback")
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Icon(Icons.support_agent,color: Colors.white,),
                          SizedBox(width: 20.w,),
                          Text("Support US")
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        margin: const EdgeInsets.only(left: 16).r,
                        child: Row(
                          children: const [
                            Icon(Icons.logout_outlined,color: Colors.red,),
                            Text("Log out",style: TextStyle(color: Colors.red),)
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
