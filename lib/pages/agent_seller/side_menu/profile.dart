import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/profile/profile_api.dart';
import 'package:property_app/api_services/profile/update_profile_api.dart';
import 'package:property_app/controller/image_picker_controller/image_picker.dart';
import 'package:property_app/controller/profile_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/post_property.dart';
import 'package:property_app/utils/color_utils.dart';
import 'package:property_app/widgets/appbar.dart';
import 'package:property_app/widgets/button.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/text_widget.dart';

import '../../../Widgets/container_widget.dart';
import '../../loading_pages/profile_loading.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileApiController = Get.put(ProfileApi());
    final profileController = Get.put(ProfileController());
    final updateProfileController = Get.put(UpdateProfileApi());
    final imagePickerController = Get.put(ImagePickerController());
    return Scaffold(
      appBar: appbar('Profile', context),
      body: FutureBuilder(
        future: profileApiController.fetchApi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProfileLoadingView();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            updateProfileController.emailController.text =
                snapshot.data.data.email ?? '';
            updateProfileController.addressController.text =
                snapshot.data.data.address ?? '';
            updateProfileController.mobileController.text =
                snapshot.data.data.mobile ?? '';

            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => profileController.isEdit.value
                        ? GestureDetector(
                            onTap: () {
                              profileController.editProfile(false);
                            },
                            child: ContainerWidget(
                                width: 100.w,
                                height: 30.h,
                                borderadius: 1.r,
                                bColor: grey_color.withOpacity(0.5),
                                child: TextWidget(
                                        text: 'Edit Profile', color: grey_color)
                                    .center()),
                          )
                        : Button(
                            color: secondary_color,
                            textcolor: white_color,
                            width: 100.w,
                            text: 'Submit',
                            ontap: () async {
                              var data =
                                  await updateProfileController.fetchApi();
                              Fluttertoast.showToast(msg: data.message);

                              profileController.editProfile(true);
                            }))
                  ],
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => imagePickerController.selectedImagePath.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                imagePickerController.pickImage();
                              },
                              child: ClipOval(
                                child: Image.file(
                                  File(
                                    imagePickerController
                                        .selectedImagePath.value,
                                  ),
                                  fit: BoxFit.fill,
                                  width: 150.w,
                                  height: 150.w,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                imagePickerController.pickImage();
                              },
                              child: ClipOval(
                                child: ImageWidget(
                                    height: 150.w,
                                    width: 150.w,
                                    url: snapshot.data.data.userImage),
                              )),
                    ),
                  ],
                ),
                12.ph,
                TextWidget(
                    text: snapshot.data.data.name ?? '',
                    color: black_color,
                    textAlign: TextAlign.center,
                    size: 20.sp),
                50.ph,
                Obx(
                  () => Visibility(
                    visible: profileController.isEdit.value,
                    replacement: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileTile(profileController,
                              controller:
                                  updateProfileController.emailController,
                              title: 'Email id',
                              value: snapshot.data.data.email ?? ''),
                          profileTile(profileController,
                              controller:
                                  updateProfileController.addressController,
                              title: 'Address',
                              value: snapshot.data.data.address ?? ''),
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileTile(profileController,
                              controller:
                                  updateProfileController.mobileController,
                              title: 'Contact Number',
                              value: snapshot.data.data.mobile ?? ''),
                          profileTile(profileController,
                              controller:
                                  updateProfileController.emailController,
                              title: 'Email id',
                              value: snapshot.data.data.email ?? ''),
                          profileTile(profileController,
                              title: 'Professional',
                              value: snapshot.data.data.type ?? ''),
                          profileTile(profileController,
                              controller:
                                  updateProfileController.addressController,
                              title: 'Address',
                              value: snapshot.data.data.address ?? ''),
                          profileTile(profileController,
                              title: 'Property Agent',
                              value: snapshot.data.data.mobile ?? ''),
                          profileTile(profileController,
                              controller:
                                  updateProfileController.mobileController,
                              title: 'Work experience',
                              value: snapshot.data.data.mobile ?? ''),
                        ]),
                  ),
                )
              ],
            );
          }
          return const ProfileLoadingView();
        },
      ),
    );
  }

  Widget profileTile(ProfileController profileController,
      {title, value, controller}) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: title, color: grey_color, size: 14.sp),
            6.ph,
            TextFormfieldWidget1(
              readOnly: profileController.isEdit.value,
              leftP: 0,
              isBorder: false,
              hint: value,
              controller: controller,
            ),
            12.ph,
          ],
        ));
  }
}
