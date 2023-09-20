import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/componets/all_buyer.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/text_widget.dart';
import '../../../../api_services/intrested_user_api.dart';
import '../../../../widgets/image_widget.dart';
import '../../details_page/buyer_details_page.dart';

class ListOfBuyers extends StatelessWidget {
  const ListOfBuyers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final intrestedUserApiController = Get.put(IntrestedUserApi());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'List of Buyers',
                color: secondary_color,
                textAlign: TextAlign.left,
                size: 14.sp,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const AllBuyersView());
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
          20.ph,
          FutureBuilder(
            future: intrestedUserApiController.fetchApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loadigUi();
              } else if (snapshot.hasError) {
                return TextWidget(text: snapshot.error.toString()).center();
              } else if (snapshot.hasData) {
                return Column(
                  children: List.generate(
                      2,
                      (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => const BuyerDetailsPage());
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.h),
                              width: double.infinity,
                              color: const Color(0xFFFAFAFA),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: ImageWidget(
                                        url: snapshot
                                            .data.data[index].interestUserImage,
                                        height: 52.w,
                                        width: 52.w),
                                  ),
                                  10.pw,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: snapshot.data.data[index].name ??
                                            '',
                                        color: const Color(0xFFC9C9C9),
                                        size: 14.sp,
                                        textAlign: TextAlign.left,
                                      ),
                                      2.ph,
                                      TextWidget(
                                        text:
                                            'Contact No.+91${snapshot.data.data[index].mobile ?? ''}',
                                        color: const Color(0xFFC9C9C9),
                                        size: 14.sp,
                                        textAlign: TextAlign.left,
                                      ),
                                      2.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: 'Min - 120 Rs',
                                            color: secondary_color,
                                            size: 10.sp,
                                          ),
                                          120.pw,
                                          TextWidget(
                                            text: snapshot
                                                    .data.data[index].timeAgo ??
                                                '',
                                            color: secondary_color,
                                            size: 10.sp,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                );
              }
              return loadigUi();
            },
          ),
        ],
      ),
    );
  }

  Column loadigUi() {
    return Column(
      children: List.generate(
          2,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: 20.w),
                child: LoadingEffect(
                    child: ContainerWidget(
                  width: double.infinity,
                  height: 40.w,
                )),
              )),
    );
  }
}
