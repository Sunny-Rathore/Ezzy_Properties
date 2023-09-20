import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_app/pages/splash.dart';

import 'Utils/color_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'property_app',
            theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: secondary_color),
              scaffoldBackgroundColor: white_color,
              textTheme: GoogleFonts.poppinsTextTheme(),
              primarySwatch: Colors.blueGrey,
            ),
            home: child,
          );
        },
        child: const Splash());
  }
}
