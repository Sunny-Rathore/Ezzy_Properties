import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../../../widgets/chip_widget.dart';

class ShortListPage extends StatelessWidget {
  const ShortListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          40.ph,
          const TextWidget(text: 'Shortlists'),
          10.ph,
          TextWidget(
            text: 'find all your shortlists at one place... ',
            color: blacktext,
            size: 14.sp,
          ),
          24.ph,
          Row(
            children: List.generate(
                2,
                (index) => ChipWidget(
                      text: index == 0 ? 'Properties' : 'Projects',
                      color: primary_color.withOpacity(0.1),
                      borderColor: primary_color,
                    )),
          ),
          12.ph,
          const Divider(
            thickness: 0.5,
          ),
          20.ph,
          ContainerWidget(
            width: double.infinity,
            height: 264.h,
            borderadius: 20.r,
            color: white_color,
            child: Column(children: [
              145.ph,
              const Divider(
                thickness: 1,
              ),
              60.ph,
              Row(
                children: [
                  12.pw,
                  Column(
                    children: [
                      TextWidget(
                        text: 'By Owner',
                        size: 12.sp,
                      ),
                      TextWidget(
                        text: '1 day ago',
                        size: 12.sp,
                        color: blacktext,
                      ),
                    ],
                  ),
                  45.pw,
                  GestureDetector(
                    onTap: () {
                      show(context);
                    },
                    child: ContainerWidget(
                      width: 100.w,
                      height: 30.h,
                      color: white_color,
                      bColor: primary_color,
                      borderadius: 4.r,
                      child: TextWidget(
                        text: 'View Number',
                        color: primary_color,
                        size: 12.sp,
                      ).center(),
                    ),
                  )
                ],
              )
            ]),
          )
          // 107.ph,
          // SvgPicture.asset(
          //   shortListImage,
          //   width: 220.w,
          //   height: 220.h,
          // ),
          // const TextWidget(
          //   text: 'You haven’t shortlist any \nproperties yet !',
          //   textAlign: TextAlign.center,
          // )
        ],
      ),
    );
  }

  Future<dynamic> show(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: white_color,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: 509.h, maxWidth: double.infinity),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        context: context,
        builder: (context) => ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                10.ph,
                Row(
                  children: [
                    TextWidget(
                      text: 'Verified by',
                      size: 14.sp,
                    ),
                    TextWidget(
                      text: 'truecaller',
                      size: 14.sp,
                      color: Colors.blue,
                    ),
                  ],
                ),
                20.ph,
                ContainerWidget(
                  height: 96.h,
                  bColor: white_color,
                  child: Row(children: [
                    26.pw,
                    CircleAvatar(
                      backgroundColor: skyblue_color.withOpacity(0.5),
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
                          TextWidget(
                            text: 'sharma@gmail.com',
                            size: 14.sp,
                            color: greytext,
                          ),
                        ]),
                  ]),
                ),
                29.ph,
                TextWidget(
                    text: 'looking property for ',
                    size: 12.sp,
                    color: Colors.black),
                6.ph,
                TextWidget(
                    text: 'Select one from the following ',
                    size: 12.sp,
                    color: greytext),
                16.ph,
                Row(
                  children: List.generate(3, (index) {
                    List list = ['self use', 'investment', 'I am a dealer'];
                    return ChipWidget(
                      text: list[index],
                      textColor: Colors.black,
                    );
                  }),
                ),
                30.ph,
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    16.ph,
                    Expanded(
                      child: TextWidget(
                        text:
                            'Allow to send notification to match your requirements',
                        color: greytext,
                        size: 12.sp,
                      ),
                    ),
                  ],
                ),
                50.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Button(
                    width: 260.w,
                    text: 'Submit',
                    ontap: () {},
                    color: secondary_color.withOpacity(0.5),
                    textcolor: white_color,
                  ),
                )
              ],
            ));
  }
}
