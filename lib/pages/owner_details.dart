import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

import '../../../Widgets/container_widget.dart';

class OwnerDetials extends StatelessWidget {
  const OwnerDetials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        57.ph,
        Row(children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: teal_color.withOpacity(0.5),
            child: Icon(
              Icons.check,
              color: white_color,
            ),
          ),
          14.pw,
          Expanded(
            child: TextWidget(
              text:
                  'user , you can use these contact details to connect with the advertiser',
              size: 12.sp,
              color: greytext,
            ),
          ),
        ]),
        34.ph,
        ContainerWidget(
          bColor: grey_color.withOpacity(0.4),
          height: 132.h,
          child: Column(
            children: [
              20.ph,
              Row(children: [
                26.pw,
                CircleAvatar(
                  backgroundColor: skyblue_color.withOpacity(0.5),
                  child: TextWidget(
                    text: "MS",
                    color: skyblue_color.withOpacity(0.5),
                  ),
                ),
                20.pw,
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: '+910123456789',
                        size: 14.sp,
                        color: Colors.black,
                      ),
                      5.ph,
                      TextWidget(
                        text: 'Mahesh Sharma',
                        size: 14.sp,
                        color: greytext,
                      ),
                      7.ph,
                    ]),
              ]),
              15.ph,
              Row(
                children: [
                  30.pw,
                  Icon(
                    Icons.call,
                    color: skyblue_color,
                    size: 25.h,
                  ),
                  20.pw,
                  const TextWidget(
                    text: '0123456789',
                    color: Colors.black,
                  )
                ],
              )
            ],
          ),
        ),
        30.ph,
        TextWidget(
          text: 'Similar Properties',
          size: 16.sp,
          color: secondary_color,
          textAlign: TextAlign.left,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: 'List Of Properties',
              color: secondary_color,
              textAlign: TextAlign.left,
              size: 14.sp,
            ),
            TextWidget(
              text: 'View All',
              color: secondary_color,
              textAlign: TextAlign.left,
              size: 12.sp,
            ),
          ],
        ),
        20.ph,
        // SizedBox(
        //   height: 313.h,
        //   child: ListView.builder(
        //     itemCount: 3,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return const PropertiesCard(
        //         index: 0,
        //       );
        //     },
        //   ),
        // ),//! use it
      ],
    ));
  }
}
