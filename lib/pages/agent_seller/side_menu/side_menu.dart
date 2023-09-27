import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/side_menu/side_menu_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/side_menu/Referals/refers.dart';
import 'package:property_app/pages/agent_seller/side_menu/profile.dart';
import 'package:property_app/widgets/image_widget.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../../../api_services/profile/profile_api.dart';
import '../../../controller/auth_controller.dart';
import '../../NewReals/reels.dart';
import '../../intro.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileApiController = Get.put(ProfileApi());

    final authController = Get.put(AuthController());
    final controller = Get.put(SideMenuController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
            future: profileApiController.fetchApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ContainerWidget(
                  color: secondary_color,
                  width: 320.w,
                  height: 166.h,
                );
              } else if (snapshot.hasError) {
                return TextWidget(text: snapshot.error.toString()).center();
              } else if (snapshot.hasData) {
                return _deawerHeader(snapshot);
              }
              return const CircularProgressIndicator().center();
            },
          ),
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TextWidget(
                //   text: 'User Details',
                //   size: 14.sp,
                // ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: authController.checkUser.value == 2
                        ? controller.sidemenuListBuyer
                            .map((val) => ListTile(
                                  horizontalTitleGap: 0,
                                  contentPadding: EdgeInsets.zero,
                                  leading: val['icon'],
                                  onTap: val['onTap'],
                                  title: TextWidget(
                                    text: val['title'],
                                    //menuList[index],
                                    size: 12.sp,
                                    color: black_color,
                                  ),
                                ))
                            .toList()
                        : controller.sidemenuList
                            .map((val) => ListTile(
                                  leading: val['icon'],
                                  horizontalTitleGap: 0,
                                  contentPadding: EdgeInsets.zero,
                                  onTap: val['onTap'],
                                  title: TextWidget(
                                    text: val['title'],
                                    //menuList[index],
                                    size: 12.sp,
                                    color: black_color,
                                  ),
                                ))
                            .toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ContainerWidget _deawerHeader(AsyncSnapshot snapshot) {
    return ContainerWidget(
      color: secondary_color,
      width: 320.w,
      height: 166.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            30.ph,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.cancel,
                  color: white_color,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: ImageWidget(
                    url: snapshot.data.data.userImage ?? '',
                    height: 70.w,
                    width: 70.w,
                  ),
                ),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: snapshot.data.data.name ?? '',
                      size: 16.sp,
                      color: white_color,
                    ),
                    TextWidget(
                      text: snapshot.data.data.email ?? '',
                      size: 14.sp,
                      color: white_color,
                    ),
                    TextWidget(
                      text: snapshot.data.data.mobile ?? '',
                      size: 14.sp,
                      color: white_color,
                    ),
                    16.ph,
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

List sidemenuList = [
  {
    'title': 'Profile',
    'icon': const Icon(Icons.person_2_outlined),
    'onTap': () {
      Get.to(const ProfileView());
    }
  },
  {
    'title': 'Change Password',
    'icon': const Icon(Icons.lock_clock_outlined),
    'onTap': () {
      // MyDiloges().changePasswordDialog(context);
    }
  },
  {
    'title': 'Reels',
    'icon': const Icon(Icons.videocam_sharp),
    'onTap': () {
      Get.to(() => const ReelPage());
    }
  },
  {
    'title': 'Listing Properties',
    'icon': const Icon(Icons.person_2_outlined),
    'onTap': () {}
  },
  {
    'title': 'View Responses',
    'icon': const Icon(Icons.message_outlined),
    'onTap': () {}
  },
  {
    'title': 'Transactions',
    'icon': const Icon(Icons.monetization_on_outlined),
    'onTap': () {}
  },
  {
    'title': 'Proposals/Bids On Properties',
    'icon': const Icon(Icons.request_quote_outlined),
    'onTap': () {}
  },
  {
    'title': 'Rating And Reviews',
    'icon': const Icon(Icons.reviews_outlined),
    'onTap': () {}
  },
  {
    'title': 'Referrals',
    'icon': const Icon(Icons.send_outlined),
    'onTap': () {
      Get.to(() => const ReferView());
    }
  },
  {'title': 'Share Feedback', 'icon': const Icon(Icons.share), 'onTap': () {}},
  {
    'title': 'Customer Service',
    'icon': const Icon(Icons.design_services_outlined),
    'onTap': () {}
  },
  {
    'title': 'Help',
    'icon': const Icon(Icons.live_help_outlined),
    'onTap': () {}
  },
  {
    'title': 'Logout',
    'icon': const Icon(Icons.logout),
    'onTap': () {
      final AuthController authController = Get.find();
      authController.logout();
      Get.offAll(const IntroScreen());
    },
  }
];
