// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/ask_questions/ask_questions_api.dart';
import 'package:property_app/api_services/properties/property_list_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Utils/img_utils.dart';
import '../../../../../Widgets/button.dart';
import '../../../../../Widgets/text_widget.dart';
import '../../../../login_signup/login.dart';
import '../../../../map/map_view.dart';
import '../../../enquiry/enquiry.dart';
import '../../../home/componets/propeties_card.dart';

class ProPertyEnquiry extends StatelessWidget {
  final int userSelectionIndex;
  const ProPertyEnquiry({
    super.key,
    required this.propertyId,
    required this.userSelectionIndex,
  });
  final String propertyId;
  @override
  Widget build(BuildContext context) {
    final ProPertListApi proPertListApi = Get.find();
    final askQuestionsApi = Get.put(AskQuestionsApi());
    // final controller = Get.put(CreateIntrestApi());

    return FutureBuilder(
      future: proPertListApi.fetchApi(propertyid: propertyId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator().center();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Owner',
                      color: blacktext,
                      textAlign: TextAlign.left,
                    ),
                    7.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: snapshot.data.data[0].postedBy ?? '',
                          size: 16.sp,
                          color: secondary_color,
                        ),
                        TextWidget(
                          text: '+91XXXXXXXX',
                          size: 16.sp,
                          color: greytext,
                        ),
                      ],
                    ),
                    16.ph,
                    Visibility(
                      visible: userSelectionIndex == 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: 'Book A Site Visit',
                            size: 16.sp,
                            color: secondary_color,
                          ),
                          Button(
                            text: 'Enquiry Now',
                            ontap: () async {
                              Get.to(() => const EnquiryForm());
                              // SharedPreferences preferences =
                              //     await SharedPreferences.getInstance();
                              // var id = preferences.getString('userId');

                              // if (id!.isEmpty) {
                              //   Get.to(() => const EnquiryForm());
                              //   // Get.to(() => const LoginView(
                              //   //     isSkip: false, userSelectionindex: 2));
                              // } else {
                              //   Get.to(() => const EnquiryForm());
                              //   String msg =
                              //       await controller.fetchApi(propertyId);
                              //   Fluttertoast.showToast(msg: msg);
                              // }
                            },
                            color: secondary_color,
                            width: 130.w,
                            textcolor: white_color,
                          )
                        ],
                      ),
                    ),
                    9.ph,
                    TextWidget(
                      text: 'Location',
                      color: secondary_color,
                      textAlign: TextAlign.left,
                    ),
                    9.ph,
                    Image.asset(
                      mapimage,
                      width: double.infinity,
                      height: 154.h,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              final String googleMapsUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${Uri.encodeQueryComponent(snapshot.data.data[0].address ?? '')}';

                              if (await canLaunch(googleMapsUrl)) {
                                await launch(googleMapsUrl);
                              } else {
                                throw 'Could not open Google Maps.';
                              }
                            },
                            child: const TextWidget(
                              text: 'Get Direction',
                              color: Colors.white,
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              double latitude;
                              double longitude;
                              try {
                                List<Location> locations =
                                    await locationFromAddress(
                                        snapshot.data.data[0].address);
                                if (locations.isNotEmpty) {
                                  latitude = locations.first.latitude;
                                  longitude = locations.first.longitude;
                                  Get.to(() => ShowMap(
                                        cityName: snapshot.data.data[0].address,
                                        lat: latitude,
                                        long: longitude,
                                      ));
                                } else {
                                  Get.snackbar(
                                      snackPosition: SnackPosition.BOTTOM,
                                      'Error',
                                      'No location found for the city: ${snapshot.data.data[0].address}');
                                  debugPrint(
                                      'No location found for the city: ${snapshot.data.data[0].address}');
                                }
                              } catch (e) {
                                debugPrint('Error getting location: $e');
                                Get.snackbar(
                                    backgroundColor: Colors.redAccent,
                                    snackPosition: SnackPosition.BOTTOM,
                                    'Error',
                                    'No location found for the city: ${snapshot.data.data[0].address}');
                              }
                            },
                            child: const TextWidget(
                              text: 'View Map',
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              15.ph,
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                color: primary_color,
                height: 95.w,
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: 'Like This Property ?',
                          color: Colors.black,
                        ),
                        TextWidget(
                          text:
                              'share with your friends and family on whatsup.',
                          color: blacktext,
                          size: 12.sp,
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share('URl');
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      width: 89.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                          color: teal_color,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(whatsAppImage),
                            5.pw,
                            TextWidget(
                              text: 'Share',
                              size: 12.sp,
                            )
                          ]),
                    ),
                  )
                ]),
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: 'Have A Question ? Ask The Owner Directly',
                      color: Colors.black,
                      textAlign: TextAlign.left,
                    ),
                    12.ph,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 9.w,
                            ),
                            color: const Color(0xFFF4F4F4),
                            child: TextField(
                              controller: askQuestionsApi.questionsController,
                              decoration: InputDecoration(
                                  hintText: 'Enter Your Question',
                                  border: InputBorder.none,
                                  constraints: BoxConstraints(maxHeight: 36.w)),
                            ),
                          ),
                        ),
                        Button(
                          width: 94.w,
                          text: 'Ask Now',
                          ontap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            var id = preferences.getString('userId');
                            if (id!.isEmpty) {
                              Get.to(() => const LoginView(
                                  isSkip: false, userSelectionindex: 2));
                            } else {
                              String msg =
                                  await askQuestionsApi.fetchApi(propertyId);
                              Fluttertoast.showToast(msg: msg);
                              if (msg == 'Success') {
                                askQuestionsApi.questionsController.clear();
                              }
                            }
                            // MyDiloges().planDialog(context);
                          },
                          color: secondary_color,
                          textcolor: white_color,
                        ),
                      ],
                    ),
                    30.ph,
                    TextWidget(
                      text: 'Similar Properties',
                      size: 20.sp,
                      color: secondary_color,
                    ),
                    20.ph,
                    FutureBuilder(
                      future: proPertListApi.fetchApi(
                          address: snapshot.data.data[0].address ?? ''),
                      builder: (BuildContext context,
                          AsyncSnapshot similarsnapshot) {
                        if (similarsnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return loadingUi();
                        } else if (similarsnapshot.hasError) {
                          return TextWidget(
                              text: similarsnapshot.error.toString());
                        } else if (snapshot.hasData) {
                          return SizedBox(
                            height: 313.w,
                            child: ListView.builder(
                              itemCount: similarsnapshot.data.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, similarindex) {
                                return PropertiesCard(
                                  userSelectionIndex: userSelectionIndex,
                                  snapshot: similarsnapshot,
                                  index: similarindex,
                                );
                              },
                            ),
                          );
                        }
                        return loadingUi();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              LoadingEffect(
                  child: ContainerWidget(
                borderadius: 10.r,
              ))
            ],
          ),
        );
      },
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
