import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    Key? key,
    this.inputType,
    required this.hint,
    required this.icon,
    this.controller,
  }) : super(key: key);
  final TextInputType? inputType;
  final String hint;
  final String icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 2.h, left: 5.w),
        focusColor: const Color(0xFFE5E4E4),
        prefixIconConstraints: BoxConstraints(maxWidth: 50.w, maxHeight: 16.h),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            icon,
          ),
        ),
        constraints: BoxConstraints(maxHeight: 40.w),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xffB2B2B2)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB2B2B2))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB2B2B2))),
      ),
    );
  }
}
