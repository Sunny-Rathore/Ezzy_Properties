import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/post_property.dart';
import 'package:property_app/widgets/appbar.dart';

import '../utils/color_utils.dart';
import '../widgets/button.dart';

class MarketingIntrestView extends StatelessWidget {
  const MarketingIntrestView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: appbar('', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          const TextFormfieldWidget1(hint: 'Full Name'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Mobile Number'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Email'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Address'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Budget'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Duration'),
          20.ph,
          const TextFormfieldWidget1(hint: 'Project Type'),
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
            ontap: () {},
            color: secondary_color,
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
