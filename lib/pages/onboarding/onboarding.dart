import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:up_todo/core/widgets/onboarding_widget.dart';
import 'package:up_todo/routes/routes.dart';
import 'package:up_todo/utils/colors.dart';

import '../../local_data/shared_preference.dart';
import '../../utils/consts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController=PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage=0;
  int lang=StorageRepository.getInt('lang')??1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const  EdgeInsets.only(left: 16,top: 16,right: 16).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RouteName.start);
                    },
                    child: Text("Skip".tr(),
                      style: TextStyle(fontSize:20.sp,
                          color: Colors.white.withOpacity(0.44)),)),
                currentPage==0?ExpansionTile(
                  title: Text("Select Language"),
                  children: [
                    RadioListTile(
                      title: Text("English"),
                        value: 0,
                        groupValue:lang,
                        onChanged: (val) async {
                          await StorageRepository.saveInt('lang', 0);
                        lang=val!;
                        context.setLocale(Locale('en',"EN"));
                        setState(() {});
                        }),
                    RadioListTile(
                      title: Text("Uzbek"),
                        value: 1,
                        groupValue:lang,
                        onChanged: (val) async {
                          await StorageRepository.saveInt('lang', 1);
                          lang=val!;
                          context.setLocale(Locale('uz',"UZ"));
                          setState(() {});
                        })
                  ],
                ):Container(),
                SizedBox(
                    height: 600.h,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => onboardings[currentPage],
                      controller: pageController,
                      onPageChanged: (val){
                        currentPage=val;
                        setState(() {});
                      },
                      physics: const BouncingScrollPhysics(),

                    )) ,//Onboarding
                SizedBox(height: currentPage==0?10.h:60.h,),
                SizedBox(
                  width: 400.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        if(currentPage!=0){
                          pageController.animateToPage(currentPage-1, duration: Duration(milliseconds: 600), curve: Curves.ease);
                        }
                      },
                          child: Text("Back".tr(),style:
                          TextStyle(color: Colors.white.withOpacity(0.44),
                            fontSize: 20.sp
                          ),)) ,// Back
                      InkWell(
                        onTap: (){
                          if(currentPage!=2){
                            pageController.animateToPage(currentPage+1, duration: const  Duration(milliseconds: 600), curve: Curves.ease);
                          }
                          if(currentPage==2){
                            Navigator.pushNamed(context, RouteName.start);
                          }
                        },
                        child: Container(
                          height: 48.h,
                          width: currentPage!=2?90.w:150.w,
                          decoration:  BoxDecoration(
                            color: MyColors.purple,
                            borderRadius: BorderRadius.circular(4).r
                          ),
                          child: Center(
                            child: Text(currentPage!=2?"Next".tr():"Get Started".tr(),style: TextStyle(fontSize: 16.sp),),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
