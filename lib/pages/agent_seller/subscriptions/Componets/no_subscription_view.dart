import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/subscriptions/Componets/update_paln_view.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Utils/img_utils.dart';
import '../../../../Widgets/container_widget.dart';
import '../../../../Widgets/text_widget.dart';

class NoSubscriptionView extends StatelessWidget {
  const NoSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(20.w),
      children: [
        10.ph,
        ContainerWidget(
            height: 72.w,
            width: 280.w,
            bColor: light_white,
            borderadius: 8.r,
            child: TextWidget(
                    size: 14.sp,
                    textAlign: TextAlign.center,
                    text:
                        'You don’t have any subscription plan\n to access features of this app')
                .center()),
        44.ph,
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              plan_bg_image,
              width: double.infinity,
              height: 403.w,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 20.h,
              child: TextWidget(
                text: 'Go Premiuml',
                size: 20.sp,
                color: white_color,
              ),
            ),
            Positioned(
              top: 45.h,
              child: TextWidget(
                text: 'No Commitment .Cancel Any Time',
                size: 14.sp,
                color: white_color,
              ),
            ),
            ContainerWidget(
              width: 270.w,
              height: 220.w,
              borderadius: 20.r,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: Column(
                  children: [
                    21.ph,
                    ContainerWidget(
                      width: 214.w,
                      height: 40.w,
                      borderadius: 50.r,
                      color: light_white,
                      bColor: light_white,
                      child: TextWidget(
                        text: 'FREE',
                        size: 20.sp,
                        color: orange_color,
                      ).center(),
                    ),
                    20.ph,
                    Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 10.w),
                                child: Row(
                                  children: [
                                    ContainerWidget(
                                      bColor: black_color,
                                      width: 10.w,
                                      height: 10.w,
                                      borderadius: 10.r,
                                      color: black_color,
                                    ),
                                    14.pw,
                                    TextWidget(
                                      text: 'Two free post properties',
                                      size: 14,
                                      color: blacktext,
                                    )
                                  ],
                                ),
                              )),
                    ),
                    20.ph,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const UpdatePlanView());
                      },
                      child: ContainerWidget(
                        width: 110.w,
                        height: 26.w,
                        borderadius: 4.r,
                        bColor: orange_color,
                        color: orange_color,
                        child: TextWidget(
                          text: 'Get More Details',
                          size: 12.sp,
                          color: white_color,
                        ).center(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
