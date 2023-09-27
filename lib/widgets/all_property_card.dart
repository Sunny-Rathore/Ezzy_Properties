import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/Widgets/container_widget.dart';
import 'package:property_app/Widgets/text_widget.dart';
import 'package:property_app/api_services/intrested_user_api.dart';
import 'package:property_app/api_services/properties/update_property.dart';
import 'package:property_app/controller/propertyCard/property_card_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/intrested_users/interested_users.dart';
import 'package:property_app/widgets/diloge.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../Utils/color_utils.dart';
import '../pages/agent_seller/details_page/property_details.dart';

class AllPropertyCard extends StatelessWidget {
  final int userdelectedindex;
  final String propertyTypeId;

  final AsyncSnapshot snapshot;
  final int index;
  const AllPropertyCard(
      {super.key,
      required this.userdelectedindex,
      required this.snapshot,
      required this.index,
      required this.propertyTypeId});

  @override
  Widget build(BuildContext context) {
    final intrestedUserApi = Get.put(IntrestedUserApi());

    final updatePropertyController = Get.put(UpdatePropertyApi());
    final cardController = Get.put(PropertyCardController());
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: ContainerWidget(
        borderadius: 10.r,
        height: userdelectedindex == 2 ? 170.w : 230.w,
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
                          height: userdelectedindex == 2 ? 100.w : 150.w,
                          width: 150,
                          url: snapshot.data.data[index].imageUrl +
                              snapshot.data.data[index].thumbnailImage,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
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
                            text: snapshot.data.data[index].propertyName ?? '',
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
                                text: snapshot.data.data[index].avgRating ?? '',
                                color: secondary_color,
                                textAlign: TextAlign.left,
                                size: 12.sp,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Visibility(
                        visible: userdelectedindex != 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Users',
                              color: secondary_color,
                              size: 12.sp,
                            ),
                            7.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder(
                                    future: intrestedUserApi.fetchApi(
                                        propertyid: snapshot
                                            .data.data[index].propertyId),
                                    builder: (BuildContext context,
                                        AsyncSnapshot usersnapshot) {
                                      if (usersnapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return lodingUserUI();
                                      } else if (usersnapshot.hasError) {
                                        return TextWidget(
                                            text:
                                                usersnapshot.error.toString());
                                      } else if (usersnapshot.hasData) {
                                        return Row(
                                          children: List.generate(
                                              usersnapshot.data.data.length > 2
                                                  ? 2
                                                  : usersnapshot
                                                      .data.data.length,
                                              (uIndex) => Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.w),
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                        usersnapshot
                                                            .data
                                                            .data[uIndex]
                                                            .interestUserImage,
                                                      ),
                                                    ),
                                                  )),
                                        );
                                      }
                                      return lodingUserUI();
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => InterestedUsersPage(
                                          imageUrl: snapshot
                                                  .data.data[index].imageUrl +
                                              snapshot.data.data[index]
                                                  .thumbnailImage,
                                          propertyid: snapshot.data.data[index]
                                                  .propertyId ??
                                              '',
                                        ));
                                  },
                                  child: TextWidget(
                                    text: 'View All',
                                    color: secondary_color,
                                    textAlign: TextAlign.left,
                                    size: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                                      ? snapshot.data.data[index].address ?? ''
                                      : snapshot.data.data[index].price ?? '',
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
              Obx(() => cardController.userid.value !=
                      snapshot.data.data[index].userId
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.w),
                      child: viewDetailsButton(
                          snapshot.data.data[index].propertyId),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        viewDetailsButton(snapshot.data.data[index].propertyId),
                        snapshot.data.data[index].status == 'Sold'
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(20, 5.w),
                                    backgroundColor: Colors.red),
                                onPressed: () async {
                                  var msg =
                                      await updatePropertyController.fetchApi(
                                          propertyId: snapshot
                                              .data.data[index].propertyId);
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
                                          propertyId: snapshot
                                              .data.data[index].propertyId);
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

  Row lodingUserUI() {
    return Row(
      children: List.generate(
          2,
          (uIndex) => Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: const LoadingEffect(
                  child: CircleAvatar(),
                ),
              )),
    );
  }

  GestureDetector viewDetailsButton(propertyId) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PropertyDetailView(
              userSelectionIndex: userdelectedindex,
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
