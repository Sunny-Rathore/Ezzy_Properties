import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/utils/string_utils.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/text_widget.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image(
                      fit: BoxFit.fill,
                      height: 140.h,
                      width: 320.w,
                      image: AssetImage(propertyImage))),
              20.ph,
              TextWidget(
                text: 'Looking For 1 Bhk Aprtment',
                color: secondary_color,
                textAlign: TextAlign.left,
              ),
              20.ph,
              SizedBox(
                height: 24.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 20.w),
                      width: 102.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: const Color(0xFFF5F5F5)),
                      child: TextWidget(
                        text: 'Vijaynagar',
                        color: secondary_color,
                        size: 14.sp,
                      ),
                    );
                  },
                ),
              ),
              20.ph,
              TextWidget(
                text: 'Description',
                color: secondary_color,
                textAlign: TextAlign.left,
                size: 14.sp,
              ),
              20.ph,
              TextWidget(
                text: dummyDetails,
                color: secondary_color,
                textAlign: TextAlign.left,
                size: 12.sp,
              ),
            ],
          ),
        ),
        40.ph,
        Container(
          padding: EdgeInsets.all(20.w),
          color: const Color(0xFFF7F7F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Request for Proposal',
                color: secondary_color,
                textAlign: TextAlign.left,
                size: 14.sp,
              ),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [textfiled('Name'), textfiled('Email id')],
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textfiled('Phone Number'),
                  textfiled('Biding Price')
                ],
              ),
              20.ph,
              Button(
                      width: 100.w,
                      text: 'Submit',
                      color: secondary_color,
                      textcolor: white_color,
                      ontap: () {
                        //Get.to(() => const PropertyDetailView());
                      })
                  .center()
            ],
          ),
        ),
      ],
    );
  }

  Column textfiled(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          size: 12.sp,
          color: secondary_color,
        ),
        10.ph,
        TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: 150.w, maxHeight: 26.h)),
        ),
      ],
    );
  }
}
