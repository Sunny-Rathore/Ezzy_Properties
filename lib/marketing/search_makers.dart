import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/marketing/makers_list.dart';
import 'package:property_app/utils/color_utils.dart';
import 'package:property_app/widgets/appbar.dart';
import 'package:property_app/widgets/button.dart';
import 'package:property_app/widgets/city_drop_down.dart';

class SearchMakers extends StatelessWidget {
  const SearchMakers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("", context),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          50.ph,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IllustrationFb3(),
            ],
          ),
          50.ph,
          const CityDropdown(),
          20.ph,
          const CityDropdown(),
          20.ph,
          Button(
            text: "Submit",
            ontap: () {
              Get.to(() => const MakersList());
            },
            color: secondary_color,
            textcolor: Colors.white,
          )
        ],
      ),
    );
  }
}

class IllustrationFb3 extends StatelessWidget {
  const IllustrationFb3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
      fit: BoxFit.fill,
      width: 200.w,
      height: 200.w,
    );
  }
}
