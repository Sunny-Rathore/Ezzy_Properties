import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/Widgets/text_widget.dart';

import '../Utils/color_utils.dart';

class ChipWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;

  const ChipWidget(
      {Key? key,
      required this.text,
      this.textColor,
      this.color,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 17.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      alignment: Alignment.center,
      height: 32.h,
      decoration: BoxDecoration(
          color: color ?? white_color,
          border: Border.all(color: borderColor ?? const Color(0xFF888888)),
          borderRadius: BorderRadius.circular(20.r)),
      child: TextWidget(
        text: text,
        size: 12.sp,
        color: textColor ?? greytext,
      ),
    );
  }
}
