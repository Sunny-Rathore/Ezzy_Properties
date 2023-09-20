import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller/slider_controller.dart';
import '../Utils/color_utils.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slidercontroller = Get.put(SliderController());
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (dotindex) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    width:
                        slidercontroller.index.value == dotindex ? 20.w : 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: slidercontroller.index.value == dotindex
                            ? secondary_color
                            : white_color,
                        border: Border.all(color: secondary_color)),
                  )),
        ));
  }
}
