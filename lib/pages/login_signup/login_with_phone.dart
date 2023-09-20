import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/login_signup/otp_page.dart';

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
import '../../widgets/textfromfield_widget.dart';

class LoginWithPone extends StatelessWidget {
  const LoginWithPone({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final slidercontroller = Get.put(SliderController());

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          40.ph,
          SliderWidget(
              asspectaaRatio: 3 / 2.5,
              slidercontroller: slidercontroller,
              slideview: SvgPicture.asset(
                userSelection,
                width: 222.w,
                height: 243.h,
              )),
          const DotIndicator(),
          30.ph,
          TextWidget(
              text: userSelection_title,
              color: secondary_color,
              size: 20.sp,
              textAlign: TextAlign.center),
          10.ph,
          TextWidget(
            textAlign: TextAlign.center,
            text: userSelection_sub_title,
            color: blacktext,
          ),
          20.ph,
          TextWidget(
              text: 'Login',
              color: secondary_color,
              size: 20.sp,
              textAlign: TextAlign.center),
          20.ph,
          TextWidget(
            textAlign: TextAlign.left,
            text: 'Enter Your Mobile Number *',
            color: blacktext,
          ),
          10.ph,
          TextFromFieldWidget(
            hint: 'Phone number',
            icon: phoneicon,
            inputType: TextInputType.number,
          ),
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  color: secondary_color,
                  textcolor: white_color,
                  text: 'Continue',
                  ontap: () {
                    Get.to(() => OtpPageView(
                          userSelectionindex: index,
                        ));
                  }),
            ],
          ),
          40.ph,
          Row(
            children: [
              const Expanded(child: Divider()),
              TextWidget(
                text: 'Or',
                color: secondary_color,
              ),
              const Expanded(child: Divider())
            ],
          ),
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SvgPicture.asset(LoginLogoList[index]),
              );
            }),
          )
        ],
      ),
    );
  }
}
