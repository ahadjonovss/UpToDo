import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_todo/core/database/dark_mode.dart';
import 'package:up_todo/local_data/shared_preference.dart';

import 'package:up_todo/routes/routes.dart';import 'package:up_todo/utils/my_styles.dart';

import 'local_data/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  StorageRepository.getInstance();
  runApp(
    EasyLocalization(
      saveLocale: true,
        supportedLocales: const [
      Locale('uz','UZ'),
          Locale('en',"EN")
    ],
        path: 'assets/translations',
        child:   MultiProvider(
            providers: [
            ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
            )],
            child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392,834),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  MaterialApp(
            theme: Styles.themeData(
                !context.watch<ThemeProvider>().getIsLight(), context),
            themeMode: context.watch<ThemeProvider>().getIsLight()
                ? ThemeMode.dark
                : ThemeMode.light,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: RouteName.main,
            debugShowCheckedModeBanner: false,
            title: 'UpToDo',
          );
        });
  }
}
