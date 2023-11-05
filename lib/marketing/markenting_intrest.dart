import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/send_enquiry/send_enquiry.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/post_property.dart';
import 'package:property_app/widgets/appbar.dart';

import '../utils/color_utils.dart';
import '../widgets/button.dart';

class MarketingIntrestView extends StatelessWidget {
  final String makerId;
  const MarketingIntrestView({super.key, required this.makerId});

  @override
  Widget build(context) {
    final controller = Get.put(SendEnquiryApi());
    return Scaffold(
      appBar: appbar('', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          TextFormfieldWidget1(
              controller: controller.nameController, hint: 'Full Name'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.phoneController, hint: 'Mobile Number'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.emailController, hint: 'Email'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.addressController, hint: 'Address'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.budetController, hint: 'Budget'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.durationController, hint: 'Duration'),
          20.ph,
          TextFormfieldWidget1(
              controller: controller.projectTypeController,
              hint: 'Project Type'),
          20.ph,
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(fontSize: 14.sp, color: const Color(0xffB2B2B2)),
              hintText: 'Enter your Work detail here',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: green_color, width: 0.5)),
            ),
          ),
          20.ph,
          Button(
            text: 'Submit',
            ontap: () async {
              await controller.fetchApi(makerId);
            },
            color: secondary_color,
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
