// ignore_for_file: deprecated_member_use

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:property_app/pages/agent_seller/transactions/transaction_details.dart';
import 'package:property_app/utils/img_utils.dart';

import '../../../Utils/color_utils.dart';
import '../../../controller/bottom_nav_controller.dart';
import '../home/home.dart';
import '../subscriptions/subscriptions_page.dart';

class BottomNavView extends StatelessWidget {
  final int userselectionindex;
  const BottomNavView({super.key, required this.userselectionindex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    List pages = <Widget>[
      const HomeView(
        userSelectionindex: 0,
      ),
      const SubscriptionsPage(),
      const TransactionDetailsView(),
    ];
    TextStyle labelStyle =
        TextStyle(color: blacktext.withOpacity(0.5), fontSize: 14.sp);
    TextStyle activelabelStyle = TextStyle(
        color: blacktext, fontSize: 14.sp, fontWeight: FontWeight.w400);
    return Scaffold(
        backgroundColor: light_white,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            backgroundColor: light_white,
            items: [
              CurvedNavigationBarItem(
                  child: SvgPicture.asset(
                    home_icon,
                    color: controller.index.value == 0
                        ? black_color
                        : blacktext.withOpacity(0.5),
                  ),
                  label: 'Home',
                  labelStyle: controller.index.value == 0
                      ? activelabelStyle
                      : labelStyle),
              CurvedNavigationBarItem(
                  child: SvgPicture.asset(
                    subscription_icon,
                    color: controller.index.value == 1
                        ? black_color
                        : blacktext.withOpacity(0.5),
                  ),
                  label: 'Subscriptions',
                  labelStyle: controller.index.value == 1
                      ? activelabelStyle
                      : labelStyle),
              CurvedNavigationBarItem(
                  child: SvgPicture.asset(
                    creditCard_icon,
                    color: controller.index.value == 2
                        ? black_color
                        : blacktext.withOpacity(0.5),
                  ),
                  label: 'Transactions',
                  labelStyle: controller.index.value == 2
                      ? activelabelStyle
                      : labelStyle),
              // CurvedNavigationBarItem(
              //     child: SvgPicture.asset(
              //       users_icon,
              //       color: controller.index.value == 3
              //           ? black_color
              //           : blacktext.withOpacity(0.5),
              //     ),
              //     label: 'Bids',
              //     labelStyle: controller.index.value == 3
              //         ? activelabelStyle
              //         : labelStyle),
            ],
            onTap: (index) {
              controller.index.value = index;
            },
          ),
        ),
        body: Obx(() => pages[controller.index.value]));
  }
}
