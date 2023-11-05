// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/properties/property_list_api.dart';
import 'package:property_app/controller/category_view_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/componets/propeties_card.dart';
import 'package:property_app/pages/agent_seller/home/recomonded_properties/recomondec_properties.dart';
import 'package:property_app/pages/view_all_property/view_all_property.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/text_widget.dart';
import '../../../../api_services/banner/ads2_api.dart';
import '../../../../api_services/banner/ads3_api.dart';
import '../../../../api_services/banner/ads4_api.dart';
import '../../../../api_services/banner/ads_api.dart';
import '../../../../api_services/properties/get_property_type_api.dart';
import '../../../../widgets/image_widget.dart';
import '../projects/projectsview.dart';
import '../recomended_projects.dart/recomended_projects.dart';
import '../verified_dealers/verified_dealers.dart';

class ListOfProperties extends StatelessWidget {
  const ListOfProperties({
    super.key,
    required this.useSelectionInidex,
  });
  final int useSelectionInidex;
  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    final categoryController = Get.put(CategoryController());

    final ads1controller = Get.put(AdsApi());
    final ads2controller = Get.put(Ads2Api());
    final ads3controller = Get.put(Ads3Api());
    final ads4controller = Get.put(Ads4Api());
    final propertytypeController = Get.put(ProPertyTypeApi());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _display_ads(ads1controller),
          20.ph,
          Visibility(
              visible: false,
              child: filtter(propertytypeController, categoryController)),
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'List Of Properties',
                color: secondary_color,
                textAlign: TextAlign.left,
                size: 17.sp,
                weight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ViewAllProperty(
                    userdelectedindex: useSelectionInidex,
                    propertyTypeId: categoryController.selectedCategory.value,
                  ));
                },
                child: TextWidget(
                  text: 'View All',
                  color: secondary_color,
                  textAlign: TextAlign.left,
                  size: 12.sp,
                ),
              ),
            ],
          ),
          20.ph,
          FutureBuilder(
            future: properttyListController.fetchApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loadingUi();
              } else if (snapshot.hasError) {
                return TextWidget(text: snapshot.error.toString());
              } else if (snapshot.hasData) {
                return snapshot.data.data.length == 0
                    ? TextWidget(
                        text: 'No Data Found',
                        color: secondary_color,
                      ).center()
                    : SizedBox(
                        height: 320.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PropertiesCard(
                              userSelectionIndex: useSelectionInidex,
                              index: index,
                              snapshot: snapshot,
                            );
                          },
                        ),
                      );
              }
              return loadingUi();
            },
          ),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child:
                _filteredProperty(properttyListController, '1', 'Residential'),
          ),
          _display_ads(ads2controller),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child:
                _filteredProperty(properttyListController, '2', 'Commercial'),
          ),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child:
                _filteredProperty(properttyListController, '3', 'Apartments'),
          ),
          20.ph,
          _display_ads(ads3controller),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child:
                _filteredProperty(properttyListController, '5', 'Plot/Lands'),
          ),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child: _filteredProperty(
                properttyListController, '6', 'Independnt House&villa'),
          ),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Recomended Properties',
                  color: secondary_color,
                  textAlign: TextAlign.left,
                  size: 17.sp,
                  weight: FontWeight.w600,
                ),
                20.ph,
                const RecomendedPropertiesView(),
              ],
            ),
          ),
          20.ph,
          _display_ads(ads4controller),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child: _filteredProperty(properttyListController, '7', 'Row House'),
          ),
          20.ph,
          Visibility(
              visible: useSelectionInidex == 2,
              child: ProjectsView(useSelectionInidex: useSelectionInidex)),
          20.ph,
          Visibility(
            visible: useSelectionInidex == 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Recomended Projects',
                  color: secondary_color,
                  textAlign: TextAlign.left,
                  size: 17.sp,
                  weight: FontWeight.w600,
                ),
                20.ph,
                RecomndedProjectsView(
                  useSelectionInidex: useSelectionInidex,
                ),
              ],
            ),
          ),
          20.ph,
          Visibility(
              visible: useSelectionInidex == 2,
              child: const VerifiedDealersView()),
        ],
      ),
    );
  }

  Widget _display_ads(controller) {
    return FutureBuilder(
      future: controller.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('');
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return _adsBuilder(snapshot);
        }
        return const Text('');
      },
    );
  }

  _adsBuilder(snapshot) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.data.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: ImageWidget(
                  width: 270.w, url: snapshot.data.data[index].files)),
        );
      },
      options: CarouselOptions(
        height: 110.h,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.ease,
        enlargeCenterPage: false,
        onPageChanged: (index, _) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _filteredProperty(ProPertListApi properttyListController, categoryId, text) {
    return FutureBuilder(
      future: properttyListController.fetchApi(propertytypeid: categoryId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingUi();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return snapshot.data.data.length == 0
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: text,
                          color: secondary_color,
                          textAlign: TextAlign.left,
                          size: 17.sp,
                          weight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ViewAllProperty(
                                userdelectedindex: useSelectionInidex,
                                propertyTypeId: categoryId));
                          },
                          child: TextWidget(
                            text: 'View All',
                            color: secondary_color,
                            textAlign: TextAlign.left,
                            size: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    SizedBox(
                      height: 320.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PropertiesCard(
                            userSelectionIndex: useSelectionInidex,
                            index: index,
                            snapshot: snapshot,
                          );
                        },
                      ),
                    ),
                  ],
                );
        }
        return loadingUi();
      },
    );
  }

  Column filtter(ProPertyTypeApi propertytypeController,
      CategoryController categoryController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Categories',
          color: secondary_color,
          size: 16.sp,
          textAlign: TextAlign.left,
          weight: FontWeight.w500,
        ),
        FutureBuilder(
          future: propertytypeController.fetchPropertyType(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loadingUi();
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
              return Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: Obx(
                      () => DropdownButton<String>(
                        isExpanded: true,
                        value: categoryController.selectedCategory.value,
                        //_selectedItem,
                        onChanged: (String? newValue) {
                          categoryController.selectedCategory.value = newValue!;
                        },
                        items: cateName
                            .map<DropdownMenuItem<String>>((String value) {
                          int index = cateName.indexOf(value);
                          return DropdownMenuItem<String>(
                            value: cateId[index],
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            }
            return loadingUi();
          },
        ),
      ],
    );
  }

  Widget loadingUi() {
    return SizedBox(
      height: 220.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return LoadingEffect(
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: ContainerWidget(
                borderadius: 10.r,
                width: 240.w,
                height: 120.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
