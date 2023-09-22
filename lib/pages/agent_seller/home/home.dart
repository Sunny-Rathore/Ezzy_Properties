// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/banner/banner_api.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/componets/grid_view.dart';
import 'package:property_app/pages/agent_seller/home/componets/listt_of_properties.dart';
import 'package:property_app/pages/agent_seller/side_menu/side_menu.dart';
import 'package:property_app/pages/login_signup/login.dart';
import 'package:property_app/pages/login_signup/user_selection.dart';
import 'package:property_app/pages/search.dart';
import 'package:property_app/widgets/image_widget.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Utils/img_utils.dart';
import '../../../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../notifications/notifications.dart';
import '../post_property/details_for_post_property.dart';
import 'componets/list_of_buyers.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.userSelectionindex})
      : super(key: key);
  final int userSelectionindex;
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    authController.checkLoginStatus();
    return Scaffold(
      drawer: const SideMenuView(),
      appBar: AppBar(
        toolbarHeight: 60.w,
        elevation: 0,
        bottom: _bottomWidget(context),
        leading: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                if (authController.userid.isEmpty) {
                  Get.to(() => LoginView(
                      isSkip: false, userSelectionindex: userSelectionindex));
                  Fluttertoast.showToast(msg: 'Need Login First');
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
              child: const Icon(Icons.menu));
        }),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: GestureDetector(
              onTap: () {
                userSelectionindex == 2
                    ? Get.to(() => const UserSelectionView())
                    : Get.to(() => const DetailsForPostProperty());
              },
              child: ContainerWidget(
                borderadius: 7.r,
                color: secondary_color,
                width: 100.w,
                height: 60.w,
                bColor: white_color.withOpacity(0.8),
                child: TextWidget(
                  text: "Post Property",
                  //'post_property',
                  size: 13.sp,
                  color: white_color.withOpacity(0.8),
                ).center(),
              ),
            ),
          ),
          GestureDetector(
              onTap: () async {
                Get.to(() => const NotificationView());
              },
              child: SvgPicture.asset(bellicon)),
          20.pw,
        ],
        backgroundColor: secondary_color,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          50.ph,
          Visibility(
              visible: userSelectionindex != 2, child: const ListOfBuyers()),
          20.ph,
          ListOfProperties(
            useSelectionInidex: userSelectionindex,
          ),
          Visibility(
                  visible: userSelectionindex == 2, child: const GridBoxView())
              .center(),
          30.ph,
        ],
      ),
    );
  }

  PreferredSize _bottomWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        double.infinity,
        200.h,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 200.h,
          ),
          _bannerview(),
          Container(
            width: 320.w,
            height: 50.w,
            decoration: BoxDecoration(
                color: white_color,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: primary_color,
                  width: 1,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: true,
                  onTap: () {
                    Get.to(
                        () => SearchPage(
                              userSelectionIndex: userSelectionindex,
                            ),
                        fullscreenDialog: true,
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 500));
                  },
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 300.w),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 15.w,
                    ),
                    focusColor: const Color(0xFFE5E4E4),
                    suffixIcon: SvgPicture.asset(searchIcon),
                    suffixIconConstraints: BoxConstraints(maxHeight: 20.w),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 14.sp, color: const Color(0xffB2B2B2)),
                  ),
                ),
              ],
            ),
          ).positioned(null, null, null, -25.0.h)
        ],
      ),
    );
  }

  Widget _bannerview() {
    final controller = Get.put(BannerApi());
    return FutureBuilder(
      future: controller.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 200.w,
            width: double.infinity,
          );
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return CarouselSlider.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, index, reelIndex) {
              return ImageWidget(
                url: snapshot.data.data[index].files,
                height: 100.w,
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              height: 200.w,

              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              // onPageChanged: (index, _) {
              //   slidercontroller.onpageScroll(index);
              // },
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return const Text("data");
      },
    );
  }
}
