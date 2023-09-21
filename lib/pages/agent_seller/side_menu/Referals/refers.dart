import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/utils/img_utils.dart';
import 'package:property_app/widgets/text_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login_signup/login.dart';

class ReferView extends StatelessWidget {
  const ReferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          120.ph,
          Image(
            image: AssetImage(
              refer_Image,
            ),
            fit: BoxFit.fill,
          ),
          100.ph,
          TextWidget(
            text: 'Refer a Friend\n&\nGet Reward',
            textAlign: TextAlign.center,
            weight: FontWeight.w600,
            size: 25.sp,
          ),
          100.ph,
          ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(120.w, 50.w)),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                var id = preferences.getString('userId');
                var referralCode = preferences.getString('CODE');

                if (id!.isEmpty) {
                  Get.to(() =>
                      const LoginView(isSkip: false, userSelectionindex: 2));
                }
                await Share.share('Link:$referralCode');
              },
              child: TextWidget(
                text: 'Share Link',
                color: Colors.white,
                size: 21.sp,
                weight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
