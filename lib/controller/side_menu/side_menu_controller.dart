import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/pages/NewReals/reels.dart';
import 'package:property_app/pages/agent_seller/short_list_page/shortlist.dart';
import 'package:property_app/pages/agent_seller/side_menu/Referals/refers.dart';
import 'package:property_app/pages/intro.dart';
import 'package:property_app/widgets/diloge.dart';
import 'package:url_launcher/url_launcher.dart';

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
      'icon': const Icon(Icons.list_alt),
      'onTap': () {
        Get.to(() => const ReelPage());
      }
    },
    {
      'title': 'Short List',
      'icon': const Icon(Icons.videocam_sharp),
      'onTap': () {
        Get.to(() => const ShortListPage());
      }
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
      'title': 'Help',
      'icon': const Icon(Icons.live_help_outlined),
      'onTap': () async {
        final call = Uri.parse('tel:+919830268966');
        if (await canLaunchUrl(call)) {
          launchUrl(call);
        } else {
          throw 'Could not launch $call';
        }
      },
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
      'title': 'Help',
      'icon': const Icon(Icons.live_help_outlined),
      'onTap': () async {
        final call = Uri.parse('tel:+919830268966');
        if (await canLaunchUrl(call)) {
          launchUrl(call);
        } else {
          throw 'Could not launch $call';
        }
      }
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
}
