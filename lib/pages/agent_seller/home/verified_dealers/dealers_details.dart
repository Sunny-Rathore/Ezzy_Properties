import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/dealer_wise_properties/dealer_wiese_properties_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/appbar.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/container_widget.dart';
import '../../../../api_services/fav_properties/fav_properties.dart';
import '../../../../api_services/properties/update_property.dart';
import '../../../../controller/propertyCard/property_card_controller.dart';
import '../../../../widgets/diloge.dart';
import '../../details_page/property_details.dart';

class DealersDetailsView extends StatelessWidget {
  const DealersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DealerWisePropertyApi());
    return Scaffold(
        appBar: appbar("", context),
        body: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator().center()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => _bannerview(controller.apiData),
                        ),
                        20.ph,
                        ImageWidget(
                                width: 100,
                                height: 100,
                                isCircle: true,
                                url:
                                    'https://ezzyproperties.com/${controller.apiData[0].dealerProfile}')
                            .center(),
                        20.ph,
                        TextWidget(
                          text: controller.apiData[0].dealerName,
                        ),
                        5.ph,
                        TextWidget(
                          text: controller.apiData[0].dealerAddress,
                          size: 12.sp,
                        ),
                        5.ph,
                        TextWidget(
                          text: 'Description',
                          size: 12.sp,
                        ),
                        TextWidget(
                          text: controller.apiData[0].description,
                          size: 12.sp,
                        ),
                        20.ph,
                        const TextWidget(
                          text: 'Properties List',
                        ),
                        20.ph,
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return _card(controller.apiData, index);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  Widget _bannerview(List apiData) {
    return CarouselSlider.builder(
      itemCount: apiData.length,
      itemBuilder: (context, index, reelIndex) {
        return ImageWidget(
          url: apiData[index].imageUrl + apiData[index].thumbnailImage,
          height: 100.w,
          width: double.infinity,
        );
      },
      options: CarouselOptions(
        height: 200.w,

        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        // onPageChanged: (index, _) {
        //   slidercontroller.onpageScroll(index);
        // },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _card(List apiData, index) {
    final favcontroller = Get.put(FavPropertyApi());
    final updatePropertyController = Get.put(UpdatePropertyApi());
    final cardController = Get.put(PropertyCardController());
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: ContainerWidget(
        borderadius: 10.r,
        height: 170.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: ImageWidget(
                          height: 100.w,
                          width: 150,
                          url: apiData[index].imageUrl +
                              apiData[index].thumbnailImage,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          apiData[index].favouriteStatus == "0"
                              ? Icons.favorite_border_outlined
                              : Icons.favorite,
                          color: apiData[index].favouriteStatus == "0"
                              ? Colors.white
                              : Colors.red,
                        ),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var userid = prefs.getString('userId');
                          if (userid!.isNotEmpty) {
                            if (apiData[index].favouriteStatus == "0") {
                              await favcontroller.fetchApi(
                                  properyid: apiData[index].propertyId,
                                  status: '1');
                            } else {
                              await favcontroller.fetchApi(
                                  properyid: apiData[index].propertyId,
                                  status: '0');
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: 'You Have to login First');
                          }
                        },
                      )
                    ],
                  ),
                  10.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: apiData[index].propertyName ?? '',
                            color: secondary_color,
                            textAlign: TextAlign.left,
                            size: 18.sp,
                            weight: FontWeight.w500,
                          ),
                          5.pw,
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.w,
                              ),
                              TextWidget(
                                text: apiData[index].avgRating ?? '',
                                color: secondary_color,
                                textAlign: TextAlign.left,
                                size: 12.sp,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.ph,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          2,
                          (boxindex) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 18.w,
                                  height: 18.w,
                                  color: const Color(0xFFE9EDF1),
                                ),
                                5.pw,
                                TextWidget(
                                  text: boxindex == 0
                                      ? apiData[index].address ?? ''
                                      : apiData[index].price ?? '',
                                  color: blacktext,
                                  size: 10.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // userdelectedindex == 2 ? 50.ph : 0.ph,
              Obx(() => cardController.userid.value != apiData[index].userId
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.w),
                      child: viewDetailsButton(apiData[index].propertyId),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        viewDetailsButton(apiData[index].propertyId),
                        apiData[index].status == 'Sold'
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(20, 5.w),
                                    backgroundColor: Colors.red),
                                onPressed: () async {
                                  var msg =
                                      await updatePropertyController.fetchApi(
                                          propertyId:
                                              apiData[index].propertyId);
                                  Fluttertoast.showToast(msg: msg);
                                },
                                child: TextWidget(
                                  text: 'Sold',
                                  color: Colors.white,
                                  size: 12.sp,
                                ))
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(20, 5.w),
                                    backgroundColor: Colors.green),
                                onPressed: () async {
                                  var msg =
                                      await updatePropertyController.fetchApi(
                                          propertyId:
                                              apiData[index].propertyId);
                                  Fluttertoast.showToast(msg: msg);
                                },
                                child: TextWidget(
                                  text: 'Open',
                                  color: Colors.white,
                                  size: 12.sp,
                                ))
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector viewDetailsButton(propertyId) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PropertyDetailView(
              userSelectionIndex: 2,
              propertyId: propertyId,
            ));
      },
      child: Container(
        alignment: Alignment.center,
        width: 80.w,
        height: 20.w,
        decoration: BoxDecoration(
            color: secondary_color, borderRadius: BorderRadius.circular(20.r)),
        child: TextWidget(
          text: 'View Details',
          color: white_color,
          size: 10.sp,
        ),
      ).center(),
    );
  }

  GestureDetector viewNubmerButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyDiloges().planDialog(context);
      },
      child: ContainerWidget(
        borderadius: 4.r,
        width: 89.w,
        height: 23.w,
        bColor: const Color(0xFF64CCC5),
        child: TextWidget(
          text: 'View Number',
          size: 10.sp,
          color: const Color(0xFF64CCC5),
        ).center(),
      ),
    );
  }
}
