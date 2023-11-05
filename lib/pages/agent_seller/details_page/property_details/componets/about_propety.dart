import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/about_property_controller/about_propety_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Widgets/text_widget.dart';
import '../../../../../api_services/properties/property_list_api.dart';
import '../../../../../widgets/diloge.dart';

class AboutProperty extends StatelessWidget {
  final String propertyId;
  const AboutProperty({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    final aboutPropertyController = Get.put(AboutPropertyController());
    return FutureBuilder(
      future: properttyListController.fetchApi(propertyid: propertyId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingUI();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: ImageWidget(
                    width: double.infinity,
                    height: 285.w,
                    url: snapshot.data.data[0].imageUrl +
                        snapshot.data.data[0].thumbnailImage,
                  ),
                ),
                20.ph,
                TextWidget(
                  text: snapshot.data.data[0].price,
                  size: 16.sp,
                  color: secondary_color,
                  textAlign: TextAlign.left,
                ),
                5.ph,
                TextWidget(
                  text: snapshot.data.data[0].propertyName,
                  size: 18.sp,
                  color: secondary_color,
                  textAlign: TextAlign.left,
                ),
                5.ph,
                Row(
                  children: [
                    TextWidget(
                      text: 'Property id:',
                      size: 12.sp,
                      color: secondary_color,
                    ),
                    TextWidget(
                      text: snapshot.data.data[0].propertyId,
                      size: 12.sp,
                      color: greytext,
                    ),
                  ],
                ),
                8.ph,
                TextWidget(
                  text: 'For : ${snapshot.data.data[0].postedFor}',
                  size: 12.sp,
                  color: greytext,
                  textAlign: TextAlign.left,
                ),
                8.ph,
                GestureDetector(
                  onTap: () {
                    MyDiloges().priceBottomsheet(context);
                  },
                  child: TextWidget(
                    text: snapshot.data.data[0].address,
                    size: 12.sp,
                    color: greytext,
                    textAlign: TextAlign.left,
                  ),
                ),
                30.ph,
                //

                Visibility(
                  visible: snapshot.data.data[0].propertyKind != 'PLot/Land',
                  child:
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                     List.generate(
                        snapshot.data.data[0].amenities.length,
                        (index) => Column(
                              children: [
                                ClipOval(
                                  child: ImageWidget(
                                      width: 50.w,
                                      height: 50.w,
                                      url: snapshot.data.data[0].imageUrl +
                                          snapshot.data.data[0].amenities[index]
                                              .icon),
                                ),
                                TextWidget(
                                  size: 10.sp,
                                  text: snapshot
                                      .data.data[0].amenities[index].name,
                                  color: secondary_color,
                                )
                              ],
                            )),
                  ),
                ),
               
                30.ph,
                TextWidget(
                  text: 'Description',
                  size: 18.sp,
                  color: secondary_color,
                  textAlign: TextAlign.left,
                ),
                10.ph,
                Obx(
                  () => Text(
                    snapshot.data.data[0].description ?? '',
                    maxLines:
                        aboutPropertyController.isExpanded.value ? null : 2,
                    overflow: aboutPropertyController.isExpanded.value
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                ),

                19.ph,
                GestureDetector(
                  onTap: () {
                    if (aboutPropertyController.isExpanded.value) {
                      aboutPropertyController.onExpand(false);
                    } else {
                      aboutPropertyController.onExpand(true);
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 110.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                          color: grey_color,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Obx(
                        () => TextWidget(
                          text: aboutPropertyController.isExpanded.value
                              ? 'View Less'
                              : 'View More',
                          size: 14.sp,
                          color: secondary_color,
                        ),
                      )).center(),
                ),
              ],
            ),
          );
        }
        return loadingUI();
      },
    );
  }

  Padding loadingUI() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingEffect(
            child: ContainerWidget(
              width: double.infinity,
              height: 285.w,
              borderadius: 10.r,
            ),
          ),
          20.ph,
          LoadingEffect(
            child: ContainerWidget(
              width: double.infinity,
              height: 25.w,
              borderadius: 10.r,
            ),
          ),
          20.ph,
          LoadingEffect(
            child: ContainerWidget(
              width: 200.w,
              height: 25.w,
              borderadius: 10.r,
            ),
          ),
          20.ph,
          LoadingEffect(
            child: ContainerWidget(
              width: 100.w,
              height: 25.w,
              borderadius: 10.r,
            ),
          ),
        ],
      ),
    );
  }
}
