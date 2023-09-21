import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/Image_zoom/image_zoom_view.dart';
import 'package:property_app/widgets/image_widget.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Widgets/text_widget.dart';
import '../../../../../api_services/properties/property_list_api.dart';

class PropertyPhotosVideos extends StatelessWidget {
  final String propertyId;
  const PropertyPhotosVideos({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    return Container(
      padding: EdgeInsets.all(13.h),
      color: light_white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Properties Photos And videos',
            size: 18.sp,
            color: secondary_color,
            textAlign: TextAlign.left,
          ),
          16.ph,
          FutureBuilder(
            future: properttyListController.fetchApi(propertyid: propertyId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _loadingUi();
              } else if (snapshot.hasError) {
                return TextWidget(text: snapshot.error.toString());
              } else if (snapshot.hasData) {
                return SizedBox(
                  height: 110.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.data[0].filesArray.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ImageZoomPage(
                                imageUrl:
                                    snapshot.data.data[0].filesArray[index]));
                          },
                          child: ImageWidget(
                              height: 110.w,
                              width: 110.w,
                              url: snapshot.data.data[0].filesArray[index]),
                        ),
                      );

                      // Container(
                      //   margin: EdgeInsets.only(right: 20.w),
                      //   height: 110.h,
                      //   width: 110.w,
                      //   color: grey_color,
                      // );
                    },
                  ),
                );
              }
              return _loadingUi();
            },
          ),
        ],
      ),
    );
  }

  SizedBox _loadingUi() {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 20.w),
            height: 110.h,
            width: 110.w,
            color: grey_color,
          );
        },
      ),
    );
  }
}
