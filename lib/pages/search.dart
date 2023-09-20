import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/search_controller/search_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/details_page/property_details.dart';
import 'package:property_app/widgets/image_widget.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/text_widget.dart';
import '../Utils/string_utils.dart';
import '../Widgets/button.dart';
import '../api_services/properties/get_property_type_api.dart';
import '../controller/filter_controller.dart';
import '../widgets/chip_widget.dart';
import '../widgets/city_drop_down.dart';
import 'agent_seller/post_property/post_property.dart';

class SearchPage extends StatelessWidget {
  final int userSelectionIndex;
  const SearchPage({Key? key, required this.userSelectionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
            children: [
          Container(
            width: 320.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: white_color,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: 300.w),
                      filled: true,
                      fillColor: const Color(0xFFF9F9F9),
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
            ),
          ),
          _filterView(),
        ]));
  }

  Widget _filterView() {
    final propertytypeController = Get.put(ProPertyTypeApi());
    final searchController = Get.put(SearchfiltterController());
    final filtercontroller = Get.put(FilterController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Find Properties of your choice !',
          color: secondary_color,
          size: 16.sp,
          textAlign: TextAlign.left,
        ),
        20.ph,
        Row(
            children: List.generate(3, (index) {
          List list = ['Buy', 'Rent', 'Project'];
          return GestureDetector(
            onTap: () {
              searchController.onChoiceChage(index);
              searchController.choice.value = list[index];
            },
            child: Obx(() => ChipWidget(
                  text: list[index],
                  borderColor: searchController.choiceIndex.value == index
                      ? primary_color
                      : Colors.grey,
                )),
          );
        })),
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
                                  color: searchController.typeindex.value == i
                                      ? primary_color
                                      : grey_color),
                              borderRadius: BorderRadius.circular(20.w)),
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
                    controller: searchController.minPrice, hint: 'Min Price')),
            20.pw,
            Expanded(
                child: TextFormfieldWidget1(
                    controller: searchController.maxPrice, hint: 'Max Price')),
          ],
        ),
        16.ph,
        Obx(
          () => Visibility(
            visible: searchController.type.value != '5',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              margin: EdgeInsets.only(right: 12.w),
                              alignment: Alignment.center,
                              width: 59.w,
                              height: 41.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        filtercontroller.roomSize.value == index
                                            ? primary_color
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
              ],
            ),
          ),
        ),
        38.ph,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              Get.to(
                  () => FilltredPropertyView(
                      controller: searchController,
                      userSelectionIndex: userSelectionIndex),
                  fullscreenDialog: true,
                  transition: Transition.downToUp);
            },
            color: secondary_color,
            textcolor: white_color,
          ),
        ])
      ],
    );
  }
}

class FilltredPropertyView extends StatelessWidget {
  final int userSelectionIndex;
  final SearchfiltterController controller;
  const FilltredPropertyView(
      {super.key, required this.controller, required this.userSelectionIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Obx(() => controller.isLoading.value
          ? const CircularProgressIndicator().center()
          : controller.dataList.isEmpty
              ? const TextWidget(text: "No Data").center()
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.w),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => PropertyDetailView(
                            propertyId: controller.dataList[index].propertyId,
                            userSelectionIndex: userSelectionIndex));
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: ImageWidget(
                            width: 40.w,
                            height: 40.w,
                            url: controller.dataList[index].imageUrl +
                                controller.dataList[index].thumbnailImage),
                      ),
                      title: TextWidget(
                        text: controller.dataList[index].propertyName,
                      ),
                      subtitle: TextWidget(
                        text: controller.dataList[index].address,
                        size: 12.sp,
                      ),
                      trailing: TextWidget(
                        text: rupees + controller.dataList[index].price,
                        size: 12.sp,
                      ),
                    );
                  },
                )),
    );
  }
}
