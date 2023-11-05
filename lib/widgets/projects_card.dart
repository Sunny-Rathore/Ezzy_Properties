import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/text_widget.dart';

import '../Utils/color_utils.dart';

class ProjectsCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  const ProjectsCard({
    super.key,
    required this.snapshot,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.only(right: 10.w, bottom: 20.w),
      width: 140.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: ImageWidget(
                width: 80.w,
                height: 80.w,
                url: snapshot.data.data[index].thumbnailImage,
              )).center(),
          20.ph,
          TextWidget(
            text: snapshot.data.data[index].projectName ?? '',
            color: secondary_color,
            textAlign: TextAlign.center,
            size: 15.sp,
            weight: FontWeight.w500,
          ).center(),
          TextWidget(
            text: snapshot.data.data[index].address ?? '',
            color: blacktext,
            size: 10.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
