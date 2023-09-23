// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/view_profile.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/appbar.dart';
import 'package:property_app/widgets/image_widget.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../Widgets/container_widget.dart';
import '../../../../Widgets/text_widget.dart';
import '../../../../api_services/intrested_user_api.dart';
import '../../../../api_services/subscriptions/plans_api.dart';
import '../../../../widgets/diloge.dart';
import '../../../../widgets/shimmer.dart';

class AllBuyersView extends StatefulWidget {
  const AllBuyersView({super.key});

  @override
  State<AllBuyersView> createState() => _AllBuyersViewState();
}

class _AllBuyersViewState extends State<AllBuyersView> {
  @override
  Widget build(BuildContext context) {
    final intrestedUserApiController = Get.put(IntrestedUserApi());
    final viewProfileApi = Get.put(ViewProfileApi());
    final plansApiController = Get.put(PlansApi());
    return Scaffold(
      appBar: appbar('All Buyers', context),
      body: FutureBuilder(
        future: intrestedUserApiController.fetchApi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadigUi();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(20.w),
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () async {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.w),
                      margin: EdgeInsets.only(bottom: 10.h),
                      width: double.infinity,
                      color: const Color(0xFFFAFAFA),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: ImageWidget(
                                url:
                                    snapshot.data.data[index].interestUserImage,
                                height: 52.w,
                                width: 52.w),
                          ),
                          10.pw,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: snapshot.data.data[index].name ?? '',
                                color: const Color(0xFFC9C9C9),
                                size: 14.sp,
                                textAlign: TextAlign.left,
                              ),
                              2.ph,
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 110.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text:
                                          'Contact No.+91${snapshot.data.data[index].mobile ?? ''}',
                                      color: const Color(0xFFC9C9C9),
                                      size: 14.sp,
                                      textAlign: TextAlign.left,
                                    ),
                                    5.pw,
                                    snapshot.data.data[index].viewed == '1'
                                        ? ContainerWidget(
                                            height: 20.w,
                                            width: 50.w,
                                            color: Colors.grey,
                                            bColor: Colors.grey,
                                            child: TextWidget(
                                              text: "View",
                                              size: 12.sp,
                                              color: Colors.white,
                                            ).center(),
                                          )
                                        : GestureDetector(
                                            onTap: () async {},
                                            child: GestureDetector(
                                              onTap: () async {
                                                // print(
                                                //     "intrested:${snapshot.data.data[index].userId} ");
                                                var mydata =
                                                    await viewProfileApi
                                                        .fetchApi(
                                                  snapshot
                                                      .data.data[index].userId,
                                                );

                                                if (mydata.msg is String) {
                                                  var plandata =
                                                      await plansApiController
                                                          .fetchApi();
                                                  MyDiloges().planDialog(
                                                      context,
                                                      mydata: plandata);
                                                }
                                                setState(() {});
                                              },
                                              child: ContainerWidget(
                                                height: 20.w,
                                                width: 50.w,
                                                color: secondary_color,
                                                bColor: secondary_color,
                                                child: TextWidget(
                                                  text: "View",
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ).center(),
                                              ),
                                            ))
                                  ],
                                ),
                              ),
                              2.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: 'Min Price - 120 Rs',
                                    color: secondary_color,
                                    size: 10.sp,
                                  ),
                                  100.pw,
                                  TextWidget(
                                    text:
                                        snapshot.data.data[index].timeAgo ?? '',
                                    color: secondary_color,
                                    size: 10.sp,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ));
              },
            );
          }
          return loadigUi();
        },
      ),
    );
  }

  Column loadigUi() {
    return Column(
      children: List.generate(
          2,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: 20.w),
                child: LoadingEffect(
                    child: ContainerWidget(
                  width: double.infinity,
                  height: 40.w,
                )),
              )),
    );
  }
}
