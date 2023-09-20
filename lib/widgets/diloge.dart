import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/auth/change_password._api.dart';
import 'package:property_app/controller/search_controller/search_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/chip_widget.dart';
import 'package:property_app/widgets/city_drop_down.dart';
import 'package:property_app/widgets/text_widget.dart';

import '../Controller/filter_controller.dart';
import '../Utils/color_utils.dart';
import '../Utils/string_utils.dart';
import '../api_services/properties/get_property_type_api.dart';
import '../pages/agent_seller/post_property/post_property.dart';
import '../pages/agent_seller/price_plan/plan_view.dart';
import '../utils/img_utils.dart';
import 'button.dart';

class MyDiloges {
  Future<dynamic> planDialog(BuildContext context, {dynamic mydata}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: 462.h),
        context: context,
        builder: (context) => ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  color: const Color(0xFF66ACE8),
                  child: TextWidget(
                    size: 20.sp,
                    text: 'Buy Subscription Plan',
                    color: white_color,
                  ),
                ),
                30.ph,
                Column(
                    children: List.generate(
                        mydata?.data?.length ?? 0,
                        (index) => GestureDetector(
                              onTap: () {
                                Get.to(() => PlanView(
                                      planId: mydata.data[index].planId ?? '',
                                      index: index,
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 20.h, left: 20.w, right: 20.w),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                height: 54.h,
                                decoration: BoxDecoration(
                                    color: white_color,
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFFDFDFDF),
                                          offset: const Offset(0, 10),
                                          blurRadius: 16.r,
                                          spreadRadius: 0)
                                    ],
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        width: 1.w,
                                        color: const Color(0xFFE9E9E9))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: mydata.data[index].name ?? '',
                                      color: secondary_color,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13,
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage(dBottom),
                  width: double.infinity,
                  height: 150.h,
                )
              ],
            ));
  }

  Future<dynamic> priceBottomsheet(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: 320.h),
        context: context,
        builder: (context) => ListView(children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 52.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: 'Price Details',
                        size: 16.sp,
                        color: secondary_color,
                        textAlign: TextAlign.center),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(cancelIcon))
                  ],
                ),
              ),
              19.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Total Price',
                          size: 14.sp,
                          color: Colors.black,
                        ),
                        TextWidget(
                          text: '70,00000',
                          size: 14.sp,
                          color: secondary_color,
                        )
                      ],
                    ),
                    20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Brokerage',
                          size: 14.sp,
                          color: grey_color,
                        ),
                        TextWidget(
                          text: 'No Brokerage',
                          size: 14.sp,
                          color: grey_color,
                        ),
                      ],
                    ),
                    20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'approx. registration charges',
                          size: 14.sp,
                          color: grey_color,
                        ),
                        TextWidget(
                          text: '4,50,000',
                          size: 14.sp,
                          color: grey_color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.ph,
              Container(
                height: 36.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: light_white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'All Inclusive Price',
                      size: 14.sp,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: '74,50,000',
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              16.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: TextWidget(
                  text: '*Charges as per details provided by the advertiser',
                  size: 14.sp,
                  color: blacktext,
                  textAlign: TextAlign.left,
                ),
              ),
            ]));
  }

  changePasswordDiloge() {
    final chagePasswordController = Get.put(ChangePasswordApi());
    return Get.dialog(AlertDialog(
        title: const TextWidget(text: 'Change Your Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormfieldWidget1(
                controller: chagePasswordController.oldPasswordController,
                hint: 'Old PassWord'),
            5.ph,
            TextFormfieldWidget1(
                controller: chagePasswordController.newPasswordController,
                hint: 'New PassWord'),
            5.ph,
            TextFormfieldWidget1(
                controller: chagePasswordController.confirmpasswordController,
                hint: 'Confirm PassWord'),
            5.ph,
            ElevatedButton(
                onPressed: () async {
                  var msg = await chagePasswordController.fetchApi();
                  Fluttertoast.showToast(msg: msg);
                  if (msg == 'Success') {
                    Get.back();
                  }
                },
                child: const TextWidget(text: "Confirm"))
          ],
        )));
  }

  void showFiltter(BuildContext ctx) {
    final propertytypeController = Get.put(ProPertyTypeApi());
    final searchController = Get.put(SearchfiltterController());
    final filtercontroller = Get.put(FilterController());
    showModalBottomSheet(
        constraints:
            BoxConstraints(minHeight: 690.h, minWidth: double.infinity),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        isScrollControlled: true,
        elevation: 10,
        backgroundColor: white_color,
        context: ctx,
        builder: (ctx) => Container(
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            width: 300,
            height: 489.h,
            alignment: Alignment.center,
            child: ListView(
              padding: EdgeInsets.all(20.h),
              children: [
                TextWidget(
                  text: 'Find Properties of your choice !',
                  color: secondary_color,
                  size: 16.sp,
                  textAlign: TextAlign.left,
                ),
                20.ph,
                Row(
                    children: List.generate(
                  2,
                  (index) => GestureDetector(
                    onTap: () {
                      searchController.onChoiceChage(index);
                      if (index == 0) {
                        searchController.choice.value = 'Buy';
                      } else {
                        searchController.choice.value = 'Rent';
                      }
                    },
                    child: Obx(() => ChipWidget(
                          text: index == 0 ? 'Buy' : 'Rent',
                          borderColor:
                              searchController.choiceIndex.value == index
                                  ? primary_color
                                  : Colors.grey,
                        )),
                  ),
                )),
                24.ph,
                const CityDropdown(),
                16.ph,
                TextWidget(
                  text: 'Property Type',
                  color: secondary_color,
                  size: 16.sp,
                  textAlign: TextAlign.left,
                ),
                16.ph,
                FutureBuilder(
                  future: propertytypeController.fetchPropertyType(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('');
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<String> cateName = [];
                      List<String> cateId = [];
                      for (int i = 0; i < snapshot.data.data.length; i++) {
                        cateName.add(snapshot.data.data[i].name);
                        cateId.add(snapshot.data.data[i].propertyTypeId);
                      }
                      cateId.add('');
                      cateName.add('Select Category');
                      return Wrap(
                        spacing: 10.w,
                        children: [
                          for (int i = 0; i < propertyType.length; i++)
                            GestureDetector(
                              onTap: () {
                                searchController.onTypeChage(i);
                                searchController
                                    .type(snapshot.data.data[i].propertyTypeId);
                              },
                              child: Obx(() => Chip(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: searchController
                                                      .typeindex.value ==
                                                  i
                                              ? primary_color
                                              : grey_color),
                                      borderRadius:
                                          BorderRadius.circular(20.w)),
                                  backgroundColor: white_color,
                                  label: TextWidget(
                                    text: snapshot.data.data[i].name,
                                    color: greytext,
                                    size: 12.sp,
                                  ))),
                            ),
                        ],
                      );
                    }
                    return const Text('');
                  },
                ),
                16.ph,
                TextWidget(
                  text: 'Budget*',
                  color: secondary_color,
                  size: 16.sp,
                  textAlign: TextAlign.left,
                ),
                19.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFormfieldWidget1(
                            controller: searchController.minPrice,
                            hint: 'Min Price')),
                    20.pw,
                    Expanded(
                        child: TextFormfieldWidget1(
                            controller: searchController.maxPrice,
                            hint: 'Max Price')),
                  ],
                ),
                16.ph,
                TextWidget(
                  text: 'Bedroom*',
                  color: secondary_color,
                  size: 16.sp,
                  textAlign: TextAlign.left,
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      roomsize.length,
                      (index) => Obx(() => GestureDetector(
                            onTap: () {
                              filtercontroller.changeSize(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 22.w),
                              alignment: Alignment.center,
                              width: 59.w,
                              height: 41.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        filtercontroller.roomSize.value == index
                                            ? Colors.blue
                                            : const Color(0xFF888888)),
                              ),
                              child: TextWidget(
                                text: roomsize[index],
                                size: 14.sp,
                                color: greytext,
                              ),
                            ),
                          ))),
                ),
                38.ph,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          width: 120.w,
                          text: 'Cancel',
                          ontap: () {
                            Get.back();
                          }),
                      Button(
                        width: 120.w,
                        text: 'Submit',
                        ontap: () async {
                          await searchController.onSubmit();
                          Get.back();
                        },
                        color: secondary_color,
                        textcolor: white_color,
                      ),
                    ])
              ],
            )));
  }
}
