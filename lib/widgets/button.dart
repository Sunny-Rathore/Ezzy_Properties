import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/Widgets/text_widget.dart';

import '../Utils/color_utils.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  final Color? textcolor;
  final double? width;
  final double? textsize;
  const Button(
      {Key? key,
      this.color,
      this.textcolor,
      this.width,
      required this.text,
      required this.ontap,
      this.textsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.resolveWith(
                (states) => Size(width ?? 210.w, 38.w)),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => color ?? white_color)),
        onPressed: ontap,
        child: TextWidget(
          text: text,
          color: textcolor ?? secondary_color,
          size: textsize ?? 16.sp,
        ));
  }
}
