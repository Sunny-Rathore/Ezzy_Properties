import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/bottom_nav_bar/bottom_nav.dart';
import 'package:property_app/pages/agent_seller/home/home.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/back_button.dart';

class OtpPageView extends StatelessWidget {
  const OtpPageView({
    Key? key,
    required this.userSelectionindex,
  }) : super(key: key);
  final int userSelectionindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        children: [
          const BackButtonWidget(),
          113.ph,
          SvgPicture.asset(
            otpImage,
            height: 216.h,
            width: 220.54.w,
          ),
          30.ph,
          TextWidget(
              text: 'Please Verify Your Number\nEnter  Your Otp',
              color: secondary_color,
              size: 20.sp,
              textAlign: TextAlign.center),
          10.ph,
          TextWidget(
              text: 'From Your Registered Mobile Number',
              color: blacktext,
              textAlign: TextAlign.center),
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 46.w,
                      width: 46.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: const Color(0xFFF7F7F7)),
                    )),
          ),
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  text: 'CONFIRM',
                  color: primary_color,
                  textcolor: white_color,
                  ontap: () {
                    Get.to(() => userSelectionindex == 1
                        ? const HomeView(
                            userSelectionindex: 1,
                          )
                        : BottomNavView(
                            userselectionindex: userSelectionindex,
                          ));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
