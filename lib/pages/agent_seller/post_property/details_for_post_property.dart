// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/diloge.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/back_button.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../api_services/subscriptions/plans_api.dart';
import '../../../widgets/chip_widget.dart';

class DetailsForPostProperty extends StatelessWidget {
  const DetailsForPostProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plansApiController = Get.put(PlansApi());
    return Scaffold(
        body: ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                ellips28,
                height: 401.h,
                width: 504.w,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                left: 60.w,
                top: 58.h,
                child: SvgPicture.asset(
                  amicoImage,
                  width: 223.53.w,
                  height: 239.33.h,
                  fit: BoxFit.fill,
                )),
            Positioned(left: 20.w, top: 24.h, child: const BackButtonWidget()),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Sell Or Rent Your Property',
                color: black_color,
                size: 20.sp,
              ),
              9.ph,
              TextWidget(
                text: 'we have over 5 lac buyers and tenants for you !',
                color: blacktext,
                size: 12.sp,
              ),
              26.ph,
              TextWidget(
                text: 'You are posting this property for',
                color: black_color,
                size: 12.sp,
              ),
              9.ph,
              Row(
                children: [
                  ChipWidget(
                    text: 'Free',
                    color: const Color(0xFF40ECC3),
                    borderColor: const Color(0xFF40ECC3),
                    textColor: white_color,
                  ),
                ],
              ),
              30.ph,
              Column(
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ContainerWidget(
                      borderadius: 4.r,
                      bColor: grey_color.withOpacity(0.2),
                      height: 50.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(children: [
                          SvgPicture.asset(
                            index == 0 ? houseImage : locationImage,
                            width: 38.w,
                            height: 38.h,
                          ),
                          16.pw,
                          TextWidget(
                            text: index == 0
                                ? 'Uploading Property Photos'
                                : 'Right Locality',
                            size: 12.sp,
                            color: black_color,
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              15.ph,
              Button(
                text: 'Continue',
                ontap: () async {
                  var mydata = await plansApiController.fetchApi();
                  MyDiloges().planDialog(context, mydata: mydata);
                },
                color: secondary_color,
                textcolor: white_color,
              ).center()
            ],
          ),
        )
      ],
    ));
  }
}
