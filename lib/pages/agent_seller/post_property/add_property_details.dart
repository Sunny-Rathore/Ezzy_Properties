import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_app/api_services/properties/post_property_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/post_property/post_property.dart';

import '../../../Controller/filter_controller.dart';
import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Utils/string_utils.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/container_widget.dart';
import '../../../Widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../../api_services/properties/get_property_type_api.dart';
import '../../../controller/category_view_controller.dart';
import '../../../controller/image_picker_controller/image_picker.dart';
import '../../../widgets/chip_widget.dart';
import '../../../widgets/city_drop_down.dart';
import '../../../widgets/state_drop_down.dart';

class AddPropertyDetails extends StatelessWidget {
  const AddPropertyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtercontroller = Get.put(FilterController());
    final imagePickerController = Get.put(ImagePickerController());
    final postPropertyApiController = Get.put(PostPropertyApi());
    final categoryController = Get.put(CategoryController());
    final propertytypeController = Get.put(ProPertyTypeApi());
    // final cityApi = Get.put(CityApi());
    // final stateApi = Get.put(StateApi());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            22.ph,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Add Property Details',
                  size: 20.sp,
                ),
              ],
            ),
            16.ph,
            TextWidget(
              text: 'Property Type',
              color: secondary_color,
              size: 14.sp,
              textAlign: TextAlign.left,
            ),
            16.ph,
            propertType(propertytypeController, categoryController),
            14.ph,
            TextWidget(
              text: 'Property Name',
              color: secondary_color,
              size: 14.sp,
              textAlign: TextAlign.left,
            ),
            5.ph,
            TextFormfieldWidget1(
                controller: postPropertyApiController.propertynameController,
                hint: 'Enter Name'),
            TextWidget(
              text: 'Address',
              color: secondary_color,
              size: 14.sp,
              textAlign: TextAlign.left,
            ),
            5.ph,
            TextFormfieldWidget1(
                controller: postPropertyApiController.addressController,
                hint: 'Address'),
            12.ph,
            TextWidget(
              text: 'Price*',
              color: secondary_color,
              size: 14.sp,
              textAlign: TextAlign.left,
            ),
            10.ph,
            TextFormfieldWidget1(
                controller: postPropertyApiController.propertyPriceController,
                hint: 'Price'),
            20.ph,
            TextWidget(
              text: 'Select your choice !',
              color: secondary_color,
              size: 14.sp,
              textAlign: TextAlign.left,
            ),
            20.ph,
            Row(
              children: List.generate(
                  2,
                  (index) => Obx(() => GestureDetector(
                        onTap: () {
                          filtercontroller.changeChoise(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 22.w),
                          alignment: Alignment.center,
                          width: 68.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      filtercontroller.propertie_Choice.value ==
                                              index
                                          ? primary_color
                                          : const Color(0xFF888888)),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: TextWidget(
                            text: filtter[index],
                            size: 14.sp,
                            color:
                                filtercontroller.propertie_Choice.value == index
                                    ? secondary_color
                                    : greytext,
                          ),
                        ),
                      ))),
            ),
            16.ph,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Area Details',
                  size: 14.sp,
                  color: Colors.black,
                ),
                5.ph,
                ContainerWidget(
                  height: 50.w,
                  borderadius: 4.r,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Carpet Area',
                          size: 12.sp,
                          color: grey_color,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormfieldWidget1(
                                controller:
                                    postPropertyApiController.areaController,
                                height: 30.0.h,
                                leftP: 0.w,
                                bottomP: 15.h,
                                hint: '',
                                isBorder: false,
                              ),
                            ),
                            Container(
                              color: grey_color,
                              height: 22.h,
                              width: 1,
                            ),
                            10.pw,
                            Obx(
                              () => SizedBox(
                                height: 20.w,
                                child: DropdownButton(
                                    value: postPropertyApiController
                                        .areaTypeId.value,
                                    underline: Container(),
                                    hint: Obx(
                                      () => TextWidget(
                                        text: filtercontroller.areaType.value,
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'SQFT',
                                        child: TextWidget(text: 'Sqft.'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'ACRE',
                                        child: Text('Acre'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'SQM',
                                        child: Text('Sqm'),
                                      ),
                                    ],
                                    onChanged: (val) {
                                      postPropertyApiController
                                          .onAreaChanged(val!);
                                    }),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            10.ph,
            Obx(
              () => Visibility(
                visible: categoryController.selectedCategory.value == '5'
                    ? false
                    : true,
                child: roomDetails(filtercontroller, postPropertyApiController),
              ),
            ),
            25.ph,
            TextWidget(
              text: 'Where is it located ?',
              size: 14.sp,
            ),
            25.ph,
            const StateDropdown(),
            25.ph,
            const CityDropdown(),
            14.ph,
            20.ph,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Add Photos',
                  size: 20.sp,
                ),
                12.ph,
                TextWidget(
                  text:
                      'Adding 4+ photos might increase responses on your property',
                  size: 14.sp,
                  color: blacktext,
                ),
                30.ph,
                TextWidget(
                  text: 'Add Property Photos',
                  size: 14.sp,
                  color: Colors.black,
                ),
                18.ph,
                Obx(() {
                  return imagePickerController.selectedImagePaths.isNotEmpty
                      ? Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: imagePickerController.selectedImagePaths
                              .map((path) {
                            return Image.file(
                              File(path),
                              width: 100,
                              height: 100,
                            );
                          }).toList(),
                        )
                      : GestureDetector(
                          onTap: () async {
                            await imagePickerController.pickImages();
                          },
                          child: SvgPicture.asset(addPropertiPhotos,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 140.h),
                        );
                }),
                30.ph,
                TextWidget(
                  text: 'Add Property Thumbnail Photo',
                  size: 14.sp,
                  color: Colors.black,
                ),
                18.ph,
                Obx(() {
                  return imagePickerController
                          .selectedImagePath.value.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            imagePickerController.pickImage();
                          },
                          child: Image.file(
                              File(imagePickerController
                                  .selectedImagePath.value),
                              width: double.infinity,
                              fit: BoxFit.fill,
                              height: 140.h),
                        )
                      : GestureDetector(
                          onTap: () {
                            imagePickerController.pickImage();
                          },
                          child: SvgPicture.asset(addPropertiPhotos,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 140.h),
                        );
                }),
                30.ph,
                TextWidget(
                  text: 'Add More information',
                  size: 14.sp,
                  color: Colors.black,
                ),
                12.ph,
                ContainerWidget(
                  width: double.infinity,
                  height: 135.h,
                  borderadius: 4.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: TextFormField(
                      controller:
                          postPropertyApiController.descriptionController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Share Some Details About Your Property',
                          hintStyle: TextStyle(
                              color: const Color(0xFFAAAAAA), fontSize: 14.sp)),
                    ),
                  ),
                ),
                20.ph,
                Obx(
                  () => postPropertyApiController.loading.value
                      ? const CircularProgressIndicator().center()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.h),
                          child: Button(
                            text: 'Submit',
                            ontap: () async {
                              String msg =
                                  await postPropertyApiController.fetchApi(
                                poperyTypeId:
                                    categoryController.selectedCategory.value,
                                postedFor:
                                    filtercontroller.propertie_Choice.value == 0
                                        ? "Sell"
                                        : 'Rent',
                              );
                              Fluttertoast.showToast(msg: msg);
                            },
                            color: secondary_color,
                            textcolor: white_color,
                          ),
                        ),
                ),
                20.ph,
              ],
            )
          ]),
    );
  }

  Column propertType(ProPertyTypeApi propertytypeController,
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
            return const Text('data');
          },
        ),
      ],
    );
  }

  Column roomDetails(FilterController filtercontroller,
      PostPropertyApi postPropertyApiController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Add Room Details',
          size: 14.sp,
          color: Colors.black,
        ),
        14.ph,
        TextWidget(
          text: 'No. of bedrooms',
          size: 14.sp,
          color: blacktext,
        ),
        Row(
          children: List.generate(
              5,
              (numindex) => GestureDetector(
                    onTap: () {
                      filtercontroller.changeNoOfBadRooms(numindex);
                      postPropertyApiController.bedRoomCount('${numindex + 1}');
                    },
                    child: ChipWidget(
                        borderColor:
                            filtercontroller.noOfBadRooms.value == numindex
                                ? primary_color
                                : grey_color,
                        color: filtercontroller.noOfBadRooms.value == numindex
                            ? primary_color.withOpacity(0.1)
                            : white_color,
                        text: (numindex + 1).toString()),
                  )),
        ),
        10.ph,
        TextWidget(
          text: 'No. of Bathrooms',
          size: 14.sp,
          color: blacktext,
        ),
        Row(
          children: List.generate(
              5,
              (numindex) => GestureDetector(
                    onTap: () {
                      filtercontroller.changeNoOfBathrooms(numindex);
                      postPropertyApiController
                          .bathRoomCount('${numindex + 1}');
                    },
                    child: ChipWidget(
                        borderColor:
                            filtercontroller.noOfBathrooms.value == numindex
                                ? primary_color
                                : grey_color,
                        color: filtercontroller.noOfBathrooms.value == numindex
                            ? primary_color.withOpacity(0.1)
                            : white_color,
                        text: (numindex + 1).toString()),
                  )),
        ),
        19.ph,
        16.ph,
        TextWidget(
          text: 'Age of Property',
          size: 14.sp,
          color: Colors.black,
        ),
        Obx(
          () => Wrap(
              spacing: 10.w,
              children: List.generate(
                ageOfPropertyList.length,
                (index) => GestureDetector(
                  onTap: () {
                    filtercontroller.changeAgeofProperty(index);

                    postPropertyApiController
                        .getAgeOfProperty(ageOfPropertyList[index]);
                  },
                  child: Chip(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color:
                                  filtercontroller.ageOfProperty.value == index
                                      ? primary_color
                                      : grey_color),
                          borderRadius: BorderRadius.circular(20.w)),
                      backgroundColor:
                          filtercontroller.ageOfProperty.value == index
                              ? primary_color.withOpacity(0.1)
                              : white_color,
                      label: TextWidget(
                        text: ageOfPropertyList[index],
                        color: greytext,
                        size: 12.sp,
                      )),
                ),
              )),
        ),
        30.ph,
        Row(
          children: [
            TextWidget(
              text: 'Furnishing Details ',
              size: 14.sp,
              color: Colors.black,
            ),
            TextWidget(
              text: '(optional)',
              size: 14.sp,
              color: grey_color,
            ),
          ],
        ),
        16.ph,
        SizedBox(
          height: 32.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: furnishingDetailsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: GestureDetector(
                  onTap: () {
                    filtercontroller.changeFurnishingDetials(index);
                    postPropertyApiController.getFurnishDetail(
                      furnishingDetailsList[index],
                    );
                  },
                  child: Obx(
                    () => Chip(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: filtercontroller.furnished.value == index
                                    ? primary_color
                                    : grey_color),
                            borderRadius: BorderRadius.circular(20.w)),
                        backgroundColor:
                            filtercontroller.furnished.value == index
                                ? primary_color.withOpacity(0.1)
                                : white_color,
                        label: TextWidget(
                          text: furnishingDetailsList[index],
                          color: greytext,
                          size: 12.sp,
                        )),
                  ),
                ),
              );
            },
          ),
        ),
        30.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: 'Reserved Parking',
              size: 14.sp,
              color: Colors.black,
            ),
            Row(
                children: List.generate(
                    2,
                    (index) => Obx(
                          () => GestureDetector(
                            onTap: () {
                              filtercontroller.changeResevedParking(index);
                              postPropertyApiController.isReservParking(
                                index == 0 ? 'Yes' : 'NO',
                              );
                            },
                            child: ChipWidget(
                              text: index == 0 ? 'Yes' : 'NO',
                              color: filtercontroller.isResevedPrking.value ==
                                      index
                                  ? primary_color.withOpacity(0.1)
                                  : Colors.white,
                              borderColor:
                                  filtercontroller.isResevedPrking.value ==
                                          index
                                      ? primary_color
                                      : Colors.white,
                            ),
                          ),
                        ))),
            36.ph,
          ],
        ),
        30.ph,
        TextWidget(
          text: 'Construction Details',
          size: 14.sp,
          color: Colors.black,
        ),
        20.ph,
        Row(
            children: List.generate(
                2,
                (index) => Obx(
                      () => GestureDetector(
                        onTap: () {
                          filtercontroller.changeConstruction(index);
                          postPropertyApiController.getConstructionStatus(
                            index == 0 ? 'Ready To Move' : 'Under Construction',
                          );
                        },
                        child: ChipWidget(
                          text: index == 0
                              ? 'Ready To Move'
                              : 'Under Construction',
                          color: filtercontroller.construction.value == index
                              ? primary_color.withOpacity(0.1)
                              : Colors.white,
                          borderColor:
                              filtercontroller.construction.value == index
                                  ? primary_color
                                  : Colors.white,
                        ),
                      ),
                    ))),
      ],
    );
  }
}
// Container(
//   width: 320.w,
//   height: 50.h,
//   decoration: BoxDecoration(
//     color: white_color,
//     borderRadius: BorderRadius.circular(4.r),
//   ),
//   child: TextField(
//     decoration: InputDecoration(
//       filled: true,
//       fillColor: const Color(0xFFF9F9F9),
//       border: OutlineInputBorder(
//           borderSide: BorderSide(color: grey_color)),
//       contentPadding: EdgeInsets.only(left: 15.w, top: 10.h),
//       focusColor: const Color(0xFFE5E4E4),
//       hintText: 'Enter City/Landmark',
//       suffixIcon: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             color: const Color(0xFFBEBEBE),
//             height: 16.h,
//             width: 1.5.w,
//           ),
//           20.pw,
//           SvgPicture.asset(searchIcon),
//           10.pw,
//         ],
//       ),
//       hintStyle: TextStyle(
//           fontSize: 14.sp, color: const Color(0xffB2B2B2)),
//     ),
//   ),
// ),
