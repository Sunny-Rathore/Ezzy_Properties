import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/utils/img_utils.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/text_widget.dart';
import '../Utils/string_utils.dart';
import 'login_signup/walkthrough.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topCenter,
              width: size.width,
              height: 603.h,
              decoration: BoxDecoration(
                  color: primary_color,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(splash_Person))),
            ),
          ),
          SvgPicture.asset(
            polygon1,
            width: 30.w,
            height: 30.h,
          ).positioned(40.21.h, null, 95.h, null),
          SvgPicture.asset(
            polygon2,
            width: 30.w,
            height: 30.h,
          ).positioned(40.21.h, null, 92.h, null),
          Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    splashBottom,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          ezzy_logo,
                          height: 136.w,
                          width: 136.w,
                        )),
                  ).positioned(110.w, null, -50.h, null),
                ],
              )),
          Column(
            children: [
              TextWidget(
                text: splash_title,
                size: 24.sp,
                textAlign: TextAlign.center,
                color: white_color,
              ),
              20.ph,
              TextWidget(
                text: splash_subtitle,
                textAlign: TextAlign.center,
                color: white_color,
              ),
              40.ph,
              Button(
                text: 'Get Started',
                ontap: () {
                  Get.to(() => const WlakThrough());
                },
                textsize: 20.sp,
              )
            ],
          ).positioned(null, null, 562.h, null)
        ],
      ),
    );
  }
}
