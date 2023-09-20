import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/intrested_user_api.dart';
import 'package:property_app/api_services/properties/update_property.dart';
import 'package:property_app/controller/propertyCard/property_card_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/details_page/property_details.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/container_widget.dart';
import '../../../../Widgets/text_widget.dart';
import '../../../../widgets/diloge.dart';
import '../../intrested_users/interested_users.dart';

class PropertiesCard extends StatelessWidget {
  const PropertiesCard({
    Key? key,
    required this.userSelectionIndex,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final int userSelectionIndex;
  final int index;
  final AsyncSnapshot<dynamic> snapshot;
  @override
  Widget build(BuildContext context) {
    final intrestedUserApi = Get.put(IntrestedUserApi());
    final updatePropertyController = Get.put(UpdatePropertyApi());
    final cardController = Get.put(PropertyCardController());
    return Container(
      margin: EdgeInsets.only(right: 10.w, bottom: 20.w),
      width: 240.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.circular(8.r),
          color: const Color(0xFFFFFFFF)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r)),
              child: ImageWidget(
                width: double.infinity,
                height: 100.w,
                url: snapshot.data.data[index].imageUrl +
                    snapshot.data.data[index].thumbnailImage,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.ph,
                Visibility(
                  visible: userSelectionIndex != 2,
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
                                  propertyid:
                                      snapshot.data.data[index].propertyId),
                              builder: (BuildContext context,
                                  AsyncSnapshot usersnapshot) {
                                if (usersnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return lodingUserUI();
                                } else if (usersnapshot.hasError) {
                                  return TextWidget(
                                      text: usersnapshot.error.toString());
                                } else if (usersnapshot.hasData) {
                                  return Row(
                                    children: List.generate(
                                        usersnapshot.data.data.length > 2
                                            ? 2
                                            : usersnapshot.data.data.length,
                                        (uIndex) => Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.w),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  usersnapshot.data.data[uIndex]
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
                                    imageUrl:
                                        snapshot.data.data[index].imageUrl +
                                            snapshot.data.data[index]
                                                .thumbnailImage,
                                    propertyid:
                                        snapshot.data.data[index].propertyId ??
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
                7.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: snapshot.data.data[index].propertyName ?? '',
                      color: secondary_color,
                      textAlign: TextAlign.left,
                      size: 12.sp,
                      weight: FontWeight.w500,
                    ),
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
                5.ph,
                Column(
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
                userSelectionIndex == 2 ? 50.ph : 0.ph,
                Obx(() => cardController.userid.value !=
                        snapshot.data.data[index].userId
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          viewDetailsButton(
                              snapshot.data.data[index].propertyId),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          viewDetailsButton(
                              snapshot.data.data[index].propertyId),
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
        ],
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
              userSelectionIndex: userSelectionIndex,
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
