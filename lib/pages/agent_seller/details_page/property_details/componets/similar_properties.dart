import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Widgets/text_widget.dart';

class SimilarPropertiesView extends StatelessWidget {
  const SimilarPropertiesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Similar Properties',
            size: 20.sp,
            color: secondary_color,
          ),
          20.ph,
          // SizedBox(
          //   height: 313.w,
          //   child: ListView.builder(
          //     itemCount: 3,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return const PropertiesCard(
          //         snapshot: ''
          //         index: 0,
          //       );
          //     },
          //   ),
          // ),//! use it
        ],
      ),
    );
  }
}
