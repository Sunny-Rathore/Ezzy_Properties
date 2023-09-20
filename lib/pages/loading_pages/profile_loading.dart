import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../Utils/color_utils.dart';

class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LoadingEffect(
              child: ContainerWidget(
                width: 100.w,
                height: 30.w,
              ),
            )
          ],
        ),
        20.ph,
        LoadingEffect(
          child: CircleAvatar(
            radius: 70.w,
            backgroundColor: grey_color,
          ),
        ),
        20.ph,
        LoadingEffect(
            child: ContainerWidget(
          width: 150.w,
          height: 25.w,
        )).center(),
        50.ph,
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return LoadingEffect(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.w),
                  child: ContainerWidget(
                    height: 40.w,
                  ),
                ),
              );
            },
          ),
        ])
      ],
    );
  }
}
