import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/transactions/transaction_details.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/string_utils.dart';
import '../../../Widgets/text_widget.dart';

class ProposalView extends StatelessWidget {
  const ProposalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        20.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextWidget(
              text: 'Your Proposals',
              color: secondary_color,
              textAlign: TextAlign.left,
              size: 14.sp,
            ),
          ]),
        ),
        10.ph,
        Column(
          children: List.generate(
              4,
              (index) => GestureDetector(
                    onTap: () {
                      Get.to(() => const TransactionDetailsView());
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.h),
                      height: 180.h,
                      width: 360.w,
                      decoration: BoxDecoration(color: colors[index]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                color: const Color(0xFFD9D9D9),
                                width: 42.w,
                                height: 42.h),
                            10.ph,
                            Column(
                              children: List.generate(
                                  3,
                                  (index) => ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 263.w),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 12.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                text: proposalDetailsMap.keys
                                                    .elementAt(index),
                                                color: blacktext,
                                                size: 12.sp,
                                              ),
                                              TextWidget(
                                                text: proposalDetailsMap.values
                                                    .elementAt(index),
                                                color: blacktext,
                                                size: 12.sp,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            )
                          ]),
                    ),
                  )),
        )
      ],
    );
  }
}
