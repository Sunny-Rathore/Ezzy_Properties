import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/pages/NewReals/reels.dart';
import 'package:property_app/pages/agent_seller/side_menu/Referals/refers.dart';
import 'package:property_app/pages/intro.dart';
import 'package:property_app/widgets/diloge.dart';

import '../../pages/agent_seller/side_menu/profile.dart';

class SideMenuController extends GetxController {
  List sidemenuListBuyer = [
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
        MyDiloges().changePasswordDiloge();
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
    {
      'title': 'Share Feedback',
      'icon': const Icon(Icons.share),
      'onTap': () {}
    },
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
        MyDiloges().changePasswordDiloge();
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
    {
      'title': 'Share Feedback',
      'icon': const Icon(Icons.share),
      'onTap': () {}
    },
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

  // void navigateTo(index, context) {
  //   switch (index) {
  //     case 0:
  //       Get.to(const ProfileView());
  //       break;
  //     case 1:
  //       MyDiloges().changePasswordDialog(context);
  //       break;
  //     case 2:
  //       Get.to(() => const ReelPage());
  //       break;
  //     case 7:
  //       Get.to(() => const ReferView());
  //       break;
  //     case 12:
  //       // authController.logout();
  //       Get.offAll(const IntroScreen());
  //   }
  // }
}
