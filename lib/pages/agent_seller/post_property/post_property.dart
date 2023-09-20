// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/add_property_details.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/string_utils.dart';
import '../../../controller/postproperty_controller.dart';
import '../../../widgets/chip_widget.dart';

class PostPropertiView extends StatelessWidget {
  const PostPropertiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postPropertycontroller = Get.put(PostPropetyController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary_color,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          TextWidget(
            text: 'Add Basic Details',
            color: secondary_color,
            size: 20.sp,
            textAlign: TextAlign.left,
          ),
          9.ph,
          TextWidget(
            text: 'your intent , property type & contact details',
            color: blacktext,
            size: 12.sp,
            textAlign: TextAlign.left,
          ),
          30.ph,
          TextWidget(
            text: 'You are looking to ?',
            color: secondary_color,
            size: 14.sp,
            textAlign: TextAlign.left,
          ),
          12.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                postProlookingFor.length,
                (index) => Obx(() => GestureDetector(
                    onTap: () {
                      postPropertycontroller.chane(index);
                    },
                    child: ChipWidget(
                      text: postProlookingFor[index],
                      color: postPropertycontroller.postPropertiy.value == index
                          ? primary_color.withOpacity(0.1)
                          : white_color,
                      textColor:
                          postPropertycontroller.postPropertiy.value == index
                              ? primary_color
                              : blacktext,
                      borderColor:
                          postPropertycontroller.postPropertiy.value == index
                              ? primary_color
                              : null,
                    )))),
          ),
          30.ph,
          TextWidget(
            text: 'What kind of property ?',
            color: secondary_color,
            size: 14.sp,
            textAlign: TextAlign.left,
          ),
          12.ph,
          Row(
            children: List.generate(
                2,
                (index) => Obx(() => GestureDetector(
                    onTap: () {
                      postPropertycontroller.chane(index);
                    },
                    child: ChipWidget(
                      text: propertyType[index],
                      color: postPropertycontroller.postPropertiy.value == index
                          ? primary_color.withOpacity(0.1)
                          : white_color,
                      textColor:
                          postPropertycontroller.postPropertiy.value == index
                              ? primary_color
                              : blacktext,
                      borderColor:
                          postPropertycontroller.postPropertiy.value == index
                              ? primary_color
                              : null,
                    )))),
          ),
          27.ph,
          TextWidget(
            text: 'Select property type',
            color: secondary_color,
            size: 14.sp,
            textAlign: TextAlign.left,
          ),
          12.ph,
          Wrap(
            spacing: 10.w,
            children: [
              for (int i = 0; i < propertyType.length; i++)
                Chip(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: grey_color),
                        borderRadius: BorderRadius.circular(20.w)),
                    backgroundColor: white_color,
                    label: TextWidget(
                      text: propertyType[i],
                      color: greytext,
                      size: 12.sp,
                    )),
            ],
          ),
          27.ph,
          TextWidget(
            text: 'Your Contact Details',
            color: secondary_color,
            size: 14.sp,
            textAlign: TextAlign.left,
          ),
          6.ph,
          const TextFormfieldWidget1(
            hint: 'Phone no./ Email',
          ),
          10.ph,
          Row(
            children: [
              TextWidget(
                text: 'if you don’t have an account register here',
                color: blacktext,
                size: 12.sp,
                textAlign: TextAlign.left,
              ),
              TextWidget(
                text: '  register here',
                color: Colors.blue,
                size: 12.sp,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          80.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: "Sumbmit",
                ontap: () {
                  showRegisterdialoge(context);
                },
                color: secondary_color,
                textcolor: white_color,
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> showRegisterdialoge(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: white_color,
        constraints: BoxConstraints(maxHeight: 302.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        )),
        context: context,
        builder: (context) => ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                32.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'This Account Is Not Registered',
                        color: secondary_color,
                        textAlign: TextAlign.left,
                      ),
                      11.ph,
                      TextWidget(
                        text: 'Please register to continue',
                        color: secondary_color,
                        textAlign: TextAlign.left,
                        size: 14.sp,
                      ),
                      79.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                              width: 152.w,
                              text: 'Cancel',
                              ontap: () {
                                Get.back();
                              }),
                          Button(
                            width: 152.w,
                            text: 'Submit',
                            ontap: () {
                              stuckInForm(context);
                            },
                            color: secondary_color,
                            textcolor: white_color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/Images/Group 12730.svg',
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.fill,
                )
              ],
            ));
  }

  Future<dynamic> stuckInForm(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        )),
        isScrollControlled: true,
        backgroundColor: white_color,
        constraints: BoxConstraints(maxHeight: 492.h),
        context: context,
        builder: (context) => ListView(
              children: [
                32.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Stuck In The Form ?',
                        color: secondary_color,
                        textAlign: TextAlign.left,
                      ),
                      11.ph,
                      TextWidget(
                        text: 'Give us your mobile number & we will call you. ',
                        color: secondary_color,
                        textAlign: TextAlign.left,
                        size: 14.sp,
                      ),
                      8.ph,
                      const TextFormfieldWidget1(
                        hint: 'Enter Your Number',
                      ),
                      40.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'or call for assistance at ',
                            color: blacktext,
                            size: 14.sp,
                          ),
                        ],
                      ),
                      30.ph,
                      Container(
                        width: 290.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: skyblue_color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: skyblue_color,
                              ),
                              12.pw,
                              TextWidget(
                                text: '0123456789',
                                color: skyblue_color,
                              )
                            ]),
                      ).center(),
                      40.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Don’t Show Again ',
                            color: secondary_color,
                            textAlign: TextAlign.left,
                            size: 16.sp,
                          ),
                        ],
                      ),
                      16.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            width: 260.w,
                            text: 'Submit',
                            ontap: () {
                              post_properti_verification(context);
                            },
                            color: secondary_color,
                            textcolor: white_color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/Images/Group 12730.svg',
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.fill,
                )
              ],
            ));
  }

  Future<dynamic> post_properti_verification(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: white_color,
        constraints: BoxConstraints(maxHeight: 368.h),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        ),
        context: context,
        builder: (context) => ListView(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              children: [
                40.ph,
                TextWidget(
                  text: 'Please Verify Your Details',
                  size: 20.sp,
                  textAlign: TextAlign.center,
                ),
                40.ph,
                TextWidget(
                  text: 'Enter Your OTP From \nRegister Mobile Number',
                  color: blacktext,
                  size: 14.sp,
                  textAlign: TextAlign.center,
                ),
                30.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4,
                      (index) => ContainerWidget(
                            width: 52.w,
                            height: 52.h,
                            bColor: primary_color,
                          )),
                ),
                30.ph,
                Button(
                  text: 'Submit',
                  ontap: () {
                    show_user_confirmation(context);
                  },
                  color: secondary_color,
                  textcolor: white_color,
                )
              ],
            ));
  }

  Future<dynamic> show_user_confirmation(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: white_color,
        constraints: BoxConstraints(maxHeight: 389.h),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        ),
        context: context,
        builder: (context) => ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                40.ph,
                TextWidget(
                  text: 'You are',
                  size: 20.sp,
                ),
                19.ph,
                Row(
                  children: List.generate(2, (index) {
                    List type = ['Owner', 'Agent'];
                    return ChipWidget(
                        color: index == 0
                            ? primary_color.withOpacity(0.1)
                            : white_color,
                        textColor: index == 0 ? primary_color : blacktext,
                        borderColor: index == 0 ? primary_color : blacktext,
                        text: type[index]);
                  }),
                ),
                30.ph,
                TextWidget(
                  text:
                      'please choose accurately .if in future you wish to change this it can only be done via the my profile section',
                  size: 14.sp,
                  color: blacktext,
                ),
                50.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Button(
                    text: 'Next',
                    ontap: () {
                      Get.to(() => const AddPropertyDetails());
                    },
                    color: secondary_color,
                    textcolor: white_color,
                  ),
                )
              ],
            ));
  }
}

class TextFormfieldWidget1 extends StatelessWidget {
  const TextFormfieldWidget1({
    Key? key,
    required this.hint,
    this.isBorder = true,
    this.height,
    this.leftP,
    this.bottomP,
    this.readOnly,
    this.controller,
  }) : super(key: key);
  final String hint;
  final bool isBorder;
  final double? height;
  final double? leftP;
  final double? bottomP;
  final bool? readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: height ?? 50.w,
      decoration: BoxDecoration(
        color: white_color,
        borderRadius: BorderRadius.circular(4.r),
        border:
            Border.all(color: isBorder ? grey_color : white_color, width: 0.5),
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: leftP ?? 15.w, bottom: bottomP ?? 0.w),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xffB2B2B2)),
        ),
      ),
    );
  }
}
