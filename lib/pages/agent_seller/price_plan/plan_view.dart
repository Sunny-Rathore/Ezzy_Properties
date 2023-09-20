import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/subscriptions/plans_api.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Utils/string_utils.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../post_property/add_property_details.dart';

class PlanView extends StatelessWidget {
  final int index;
  final String planId;
  const PlanView({Key? key, required this.index, required this.planId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlansApi plansApiController = Get.find();
    return Scaffold(
      body: FutureBuilder(
        future: plansApiController.fetchApi(planId: planId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return loadigUi();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            return Stack(
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          40.ph,
                          ContainerWidget(
                            height: 50.h,
                            width: double.infinity,
                            color: const Color(0XFFF9F9F9),
                            bColor: const Color(0XFFF9F9F9),
                            borderadius: 50.r,
                            child: TextWidget(
                              text: snapshot.data.data[0].name ?? '',
                              size: 30.sp,
                              color: index == 0
                                  ? orange_color
                                  : index == 1
                                      ? blueGrey_color
                                      : darkBlue_color,
                            ).center(),
                          ),
                          24.ph,
                          TextWidget(
                            text: snapshot.data.data[0].description ?? '',
                            // 'The uiltimate packages for the professional real estate agent or agency, with everything included.',
                            textAlign: TextAlign.center,
                            size: 14.sp,
                            color: blacktext,
                          ),
                          20.ph,
                          _showplan(
                            '${snapshot.data.data[0].freePosts} Free posts',
                          ),
                          20.ph,
                          _showplan(
                            '${snapshot.data.data[0].freeProfileViews} Free Profile Views',
                          ),
                          20.ph,
                          _showplan(
                            ' Validate Till ${snapshot.data.data[0].validity + ' ' + snapshot.data.data[0].validityUnit}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        index == 0
                            ? basicImage
                            : index == 1
                                ? classicImage
                                : premiumImage,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 306.w,
                      ),
                      Column(
                        children: [
                          TextWidget(
                            text:
                                rupees + snapshot.data.data[0].price.toString(),
                            size: 40.sp,
                            color: white_color,
                          ),
                          45.ph,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AddPropertyDetails());
                            },
                            child: ContainerWidget(
                              width: 200.w,
                              height: 50.h,
                              borderadius: 4.r,
                              child: TextWidget(
                                text: 'Pay Now',
                                color: index == 0
                                    ? orange_color
                                    : index == 1
                                        ? blueGrey_color
                                        : darkBlue_color,
                                size: 30.sp,
                              ).center(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return const TextWidget(text: 'text');
        },
      ),
    );
  }

  Row _showplan(String text) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: green_color,
          size: 15.w,
        ),
        10.pw,
        TextWidget(
          text: text,
          size: 14.sp,
          color: blacktext,
        ),
      ],
    );
  }
}
