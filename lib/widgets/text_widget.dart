import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/color_utils.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? textAlign;
  const TextWidget({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          fontSize: size ?? 16.sp,
          fontWeight: weight ?? FontWeight.w400,
          color: color ?? secondary_color),
    );
  }
}
