import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/dealers_api/dealers_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/verified_dealers/dealers_details.dart';

import '../../../../Utils/string_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../../widgets/image_widget.dart';
import '../../../../widgets/text_widget.dart';

class VerifiedDealersView extends StatelessWidget {
  const VerifiedDealersView({super.key});

  @override
  Widget build(BuildContext context) {
    return _dealerItems();
  }

  _dealerItems() {
    final controller = Get.put(DealersApi());
    return FutureBuilder(
      future: controller.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator().center();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return snapshot.data.data.length == 0
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Verified Dealers",
                      color: secondary_color,
                      textAlign: TextAlign.left,
                      size: 17.sp,
                      weight: FontWeight.w600,
                    ),
                    20.ph,
                    SizedBox(
                      height: 210.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _dealersCard(snapshot, index: index);
                        },
                      ),
                    ),
                  ],
                );
        }
        return const CircularProgressIndicator().center();
      },
    );
  }

  _dealersCard(AsyncSnapshot snapshot, {required int index}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DealersDetailsView());
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w, bottom: 20.w),
        width: 140.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
                    child: ImageWidget(
                        width: 80.w,
                        height: 80.w,
                        url: snapshot.data.data[index].userImage ?? ''))
                .center(),
            20.ph,
            TextWidget(
              text: snapshot.data.data[index].name ?? '',
              color: secondary_color,
              textAlign: TextAlign.center,
              size: 15.sp,
              weight: FontWeight.w500,
            ),
            TextWidget(
              text: snapshot.data.data[index].address ?? '',
              color: blacktext,
              size: 10.sp,
              textAlign: TextAlign.center,
            ),
            TextWidget(
              text: rupees + snapshot.data.data[index].workerPrice,
              color: blacktext,
              size: 10.sp,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
