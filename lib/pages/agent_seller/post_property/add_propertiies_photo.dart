import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/image_picker_controller/image_picker.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/post_property.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPropertiPhotos extends StatelessWidget {
  const AddPropertiPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerController = Get.put(ImagePickerController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          22.ph,
          TextWidget(
            text: 'Add Photos & Pricing',
            size: 20.sp,
          ),
          12.ph,
          TextWidget(
            text: 'Adding 4+ photos might increase responses on your property',
            size: 14.sp,
            color: blacktext,
          ),
          30.ph,
          TextWidget(
            text: 'Add Property Photos',
            size: 14.sp,
            color: Colors.black,
          ),
          18.ph,
          Obx(() {
            return imagePickerController.selectedImagePaths.isNotEmpty
                ? Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        imagePickerController.selectedImagePaths.map((path) {
                      return Image.file(
                        File(path),
                        width: 100,
                        height: 100,
                      );
                    }).toList(),
                  )
                : GestureDetector(
                    onTap: () async {
                      await imagePickerController.pickImages();
                    },
                    child: SvgPicture.asset(addPropertiPhotos,
                        width: double.infinity, height: 140.h),
                  );
          }),
          30.ph,
          TextWidget(
            text: 'Add Property Thumbnail Photo',
            size: 14.sp,
            color: Colors.black,
          ),
          18.ph,
          Obx(() {
            return imagePickerController.selectedImagePath.value.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      imagePickerController.pickImage();
                    },
                    child: Image.file(
                        File(imagePickerController.selectedImagePath.value),
                        width: double.infinity,
                        fit: BoxFit.fill,
                        height: 140.h),
                  )
                : GestureDetector(
                    onTap: () {
                      imagePickerController.pickImage();
                    },
                    child: SvgPicture.asset(addPropertiPhotos,
                        width: double.infinity, height: 140.h),
                  );
          }),
          30.ph,
          TextWidget(
            text: 'Pricing Details',
            size: 14.sp,
            color: Colors.black,
          ),
          12.ph,
          const TextFormfieldWidget1(
            hint: 'Enter Expected Price',
          ),
          30.ph,
          TextWidget(
            text: 'Add More information',
            size: 14.sp,
            color: Colors.black,
          ),
          12.ph,
          ContainerWidget(
            width: double.infinity,
            height: 135.h,
            borderadius: 4.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Share Some Details About Your Property',
                    hintStyle: TextStyle(
                        color: const Color(0xFFAAAAAA), fontSize: 14.sp)),
              ),
            ),
          ),
          50.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Button(
              text: 'Next',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            constraints: BoxConstraints(maxHeight: 525.h),
                            child: Column(
                              children: [
                                30.ph,
                                Stack(
                                  children: [
                                    Image.asset(
                                      failPopup1,
                                      width: 239.w,
                                      height: 184.h,
                                    ),
                                    Image.asset(
                                      failPopup2,
                                      width: 239.w,
                                      height: 184.h,
                                    ),
                                  ],
                                ),
                                46.ph,
                                TextWidget(
                                  text: 'oops , failed !',
                                  size: 20.sp,
                                  color: const Color(0xFFED4747),
                                ),
                                12.ph,
                                TextWidget(
                                  text:
                                      'please check your internet connection then try again',
                                  size: 14.sp,
                                  color: Colors.black,
                                ),
                                20.ph,
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r)),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                constraints: BoxConstraints(
                                                    maxHeight: 455.h),
                                                child: Column(
                                                  children: [
                                                    30.ph,
                                                    Stack(
                                                      children: [
                                                        Image.asset(
                                                          successPopup1,
                                                          width: 239.w,
                                                          height: 184.h,
                                                        ),
                                                        Image.asset(
                                                          successPopup2,
                                                          width: 239.w,
                                                          height: 184.h,
                                                        ),
                                                      ],
                                                    ),
                                                    46.ph,
                                                    TextWidget(
                                                      text: 'Successful',
                                                      size: 20.sp,
                                                      color: const Color(
                                                          0xFF8EFEBA),
                                                    ),
                                                    12.ph,
                                                    TextWidget(
                                                      text:
                                                          'please check your internet connection then try again',
                                                      size: 14.sp,
                                                      color: Colors.black,
                                                    ),
                                                    20.ph,
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Get.offAll(
                                                        //     () => BottomNavView(
                                                        //           userselectionindex:
                                                        //               userSelectionindex,
                                                        //         ));
                                                      },
                                                      child: ContainerWidget(
                                                        width: 260.w,
                                                        height: 50.h,
                                                        color: secondary_color,
                                                        borderadius: 34.r,
                                                        child: TextWidget(
                                                          text: 'Done',
                                                          color: white_color,
                                                          size: 20.sp,
                                                        ).center(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  child: ContainerWidget(
                                    width: 260.w,
                                    height: 50.h,
                                    color: secondary_color,
                                    borderadius: 34.r,
                                    child: TextWidget(
                                      text: 'Try Again',
                                      color: white_color,
                                      size: 20.sp,
                                    ).center(),
                                  ),
                                ),
                                33.ph,
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: ContainerWidget(
                                    bColor: const Color(0XFFACD7FC)
                                        .withOpacity(0.2),
                                    width: 260.w,
                                    height: 50.h,
                                    color: const Color(0XFFACD7FC)
                                        .withOpacity(0.2),
                                    borderadius: 34.r,
                                    child: TextWidget(
                                      text: 'Cancel',
                                      color: secondary_color,
                                      size: 20.sp,
                                    ).center(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
              },
              color: secondary_color,
              textcolor: white_color,
            ),
          )
        ],
      ),
    );
  }
}
