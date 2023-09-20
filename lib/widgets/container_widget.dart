import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/color_utils.dart';

class ContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Color? bColor;
  final double? borderadius;
  final Widget? child;

  const ContainerWidget(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.bColor,
      this.borderadius,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ?? white_color,
        border: Border.all(color: bColor ?? grey_color),
        borderRadius: BorderRadius.circular(borderadius ?? 0.r),
      ),
      child: child,
    );
  }
}
