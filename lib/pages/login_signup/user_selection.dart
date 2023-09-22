import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/login_signup/login.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/text_widget.dart';
import '../../Controller/slider_controller.dart';
import '../../Utils/string_utils.dart';
import '../../Widgets/dotindicator.dart';
import '../../Widgets/slider.dart';
import '../../controller/user_selection_controller.dart';

class UserSelectionView extends StatelessWidget {
  const UserSelectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final slidercontroller = Get.put(SliderController());
    final userselectionController = Get.put(UserSelectionController());
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          60.ph,
          SliderWidget(
              asspectaaRatio: 3.h / 2.h,
              slidercontroller: slidercontroller,
              slideview: SvgPicture.asset(
                userSelection,
                width: 222.w,
                height: 243.h,
              )),
          const DotIndicator(),
          30.ph,
          TextWidget(
            text: userSelection_title,
            size: 20.sp,
          ).center(),
          10.ph,
          TextWidget(
            textAlign: TextAlign.center,
            text: userSelection_sub_title,
            color: blacktext,
          ).center(),
          40.ph,
          Column(
              children: List.generate(2, (index) {
            return Obx(() => ListTile(
                  selectedTileColor: primary_color,
                  selectedColor: blacktext,
                  selected:
                      userselectionController.selectuserIndex.value == index
                          ? true
                          : false,
                  onTap: () {
                    userselectionController.selectUser(index);
                  },
                  leading: Radio(
                      activeColor: Colors.black,
                      value: userselectionController.selectuserIndex.value,
                      groupValue: index,
                      onChanged: (val) {}),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 12.w,
                  ),
                  title: TextWidget(
                    textAlign: TextAlign.left,
                    text: UserSelectionList[index],
                  ),
                ));
          })),
          40.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  color: secondary_color,
                  textcolor: white_color,
                  text: 'Continue',
                  ontap: () {
                    Get.to(() => LoginView(
                          isSkip: false,
                          userSelectionindex:
                              userselectionController.selectuserIndex.value,
                        ));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
