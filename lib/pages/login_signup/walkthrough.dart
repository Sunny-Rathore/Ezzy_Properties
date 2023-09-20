import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/login_signup/login.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/slider_controller.dart';
import '../../Utils/string_utils.dart';
import '../../Widgets/dotindicator.dart';
import '../../Widgets/slider.dart';

class WlakThrough extends StatelessWidget {
  const WlakThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slidercontroller = Get.put(SliderController());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          80.ph,
          SliderWidget(
            slidercontroller: slidercontroller,
            slideview: sliderview(),
          ),
          const DotIndicator(),
          30.ph,
          TextWidget(
            text: wlt_subtitle,
            color: blacktext,
            textAlign: TextAlign.center,
            size: 16.sp,
          ),
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  text: 'Continue',
                  textcolor: white_color,
                  color: secondary_color,
                  ontap: () {
                    Get.to(const LoginView(userSelectionindex: 2));
                    //  Get.to(() => const UserSelectionView());
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Column sliderview() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image(width: 304.w, height: 360.h, image: AssetImage(wlT_Banner)),
            SvgPicture.asset(
              ellipse,
              width: 30.w,
              height: 30.w,
            ).positioned(-10.0.w, null, -10.w.h),
            SvgPicture.asset(
              ellipse,
              width: 10.w,
              height: 10.w,
            ).positioned(120.0.w, null, -20.0.h),
            SvgPicture.asset(
              ellipse,
              width: 20.w,
              height: 20.w,
            ).positioned(null, 30.0.w, -20.0.h, null),
            SvgPicture.asset(
              ellipse,
              width: 30.w,
              height: 30.w,
            ).positioned(30.0.w, null, null, 10.0.h),
            SvgPicture.asset(
              ellipse,
              width: 30.w,
              height: 30.w,
            ).positioned(null, -20.0.w, null, -10.0.h),
          ],
        ),
        30.ph,
        TextWidget(
          text: wlt_title,
          size: 20.sp,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
