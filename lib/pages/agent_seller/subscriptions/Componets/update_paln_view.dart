import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/subscriptions/get_subscription.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/container_widget.dart';
import '../../../../Widgets/text_widget.dart';

class UpdatePlanView extends StatelessWidget {
  const UpdatePlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final showSubsCriptionApi = Get.put(ShowSubsCriptionApi());
    return FutureBuilder(
      future: showSubsCriptionApi.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator().center();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(20.w),
            children: [
              54.ph,
              ContainerWidget(
                  height: 72.h,
                  width: 280.w,
                  color: secondary_color,
                  bColor: secondary_color,
                  borderadius: 8.r,
                  child: TextWidget(
                          size: 20.sp,
                          textAlign: TextAlign.center,
                          color: white_color,
                          text:
                              'You Have Subscribed\n ${snapshot.data.data[0].planName ?? ''} Plan')
                      .center()),
              44.ph,
              TextWidget(
                  size: 20.sp,
                  textAlign: TextAlign.center,
                  color: black_color,
                  text: '${snapshot.data.data[0].planName ?? ''} Plan Details'),
              30.ph,
              planDetail(
                  '${snapshot.data.data[0].freePosts ?? ''} free post properties'),
              5.ph,
              planDetail(
                  '${snapshot.data.data[0].freeProfileViews ?? ''} View Profiles'),
              5.ph,
              planDetail(
                  'Expir On Date${snapshot.data.data[0].expiryDate ?? ''}'),
              5.ph,
              planDetail(
                  '${snapshot.data.data[0].timeAgo ?? ''} You Have Subscribe for  this plan '),
              160.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 61.w),
                child: ContainerWidget(
                  width: 238.w,
                  height: 44.w,
                  borderadius: 40.r,
                  color: secondary_color,
                  bColor: secondary_color,
                  child: TextWidget(
                    text: 'UPDATE NOW',
                    size: 20.sp,
                    color: white_color,
                  ).center(),
                ),
              )
            ],
          );
        }
        return const Text('NO Data');
      },
    );
  }

  Row planDetail(text) {
    return Row(
      children: [
        ContainerWidget(
          bColor: black_color,
          width: 10.w,
          height: 10.w,
          borderadius: 10.r,
          color: black_color,
        ),
        14.pw,
        Flexible(
          child: TextWidget(
            text: text,
            size: 14.sp,
            color: blacktext,
          ),
        )
      ],
    );
  }
}
