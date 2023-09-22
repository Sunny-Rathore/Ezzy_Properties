// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Utils/string_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/text_widget.dart';
import '../../../widgets/textfromfield_widget.dart';

class EnquiryForm extends StatelessWidget {
  const EnquiryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary_color,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          10.ph,
          TextWidget(
            text: 'Contact Owner',
            color: secondary_color,
            size: 16.sp,
            textAlign: TextAlign.left,
          ),
          10.ph,
          const TextWidget(
            text: 'Get A Call Back And Resolve Your Queries',
            color: Color(0xFF6D6A6A),
            textAlign: TextAlign.left,
          ),
          30.ph,
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 64.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: white_color,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(width: 1.w, color: const Color(0xFFE9E9E9))),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                ),
                15.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Ravindra Sharma',
                      color: secondary_color,
                    ),
                    TextWidget(
                      text: 'Owner +91XXXXXXXX',
                      color: greytext,
                    ),
                  ],
                ),
              ],
            ),
          ),
          33.ph,
          TextWidget(
            text: 'Enter Your Name',
            color: blacktext,
            textAlign: TextAlign.left,
          ),
          12.ph,
          TextFromFieldWidget(
            hint: 'Name',
            icon: userIcon,
          ),
          12.ph,
          TextWidget(
            text: 'Enter Your Email (optional)',
            color: blacktext,
            textAlign: TextAlign.left,
          ),
          12.ph,
          TextFromFieldWidget(
            hint: 'Email Id',
            icon: userIcon,
          ),
          12.ph,
          TextWidget(
            text: 'Enter Your Mobile Number *',
            color: blacktext,
            textAlign: TextAlign.left,
          ),
          12.ph,
          TextFromFieldWidget(
            hint: 'Phone Number',
            icon: userIcon,
          ),
          20.ph,
          TextWidget(
            text: 'Looking Property For',
            color: secondary_color,
            textAlign: TextAlign.left,
          ),
          5.ph,
          TextWidget(
            text: 'Select one from following',
            color: blacktext,
            size: 12.sp,
            textAlign: TextAlign.left,
          ),
          14.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffB2B2B2)),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: TextWidget(
                        text: lookingList[index],
                        color: Colors.black,
                        size: 14.sp,
                      ),
                    )),
          ),
          50.ph,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                width: 260.w,
                text: 'Submit',
                ontap: () {
                  //Get.to(const OwnerDetials());
                },
                color: secondary_color,
                textcolor: white_color,
              ),
            ],
          ),

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
      ),
    );
  }
}
