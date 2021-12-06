
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:userbook/presentation/routes/app_pages.dart';
import 'package:userbook/presentation/routes/app_routes.dart';

import 'core/utils/app_color.dart';
import 'presentation/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: primaryColor,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(dark);


    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder: ()=>  GetMaterialApp(
      title: 'UserBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
        home : SplashScreen(),
        getPages: AppPages.list,
        builder: EasyLoading.init(),
    ),
    );

  }
}
