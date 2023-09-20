import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/intrested_user_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';
import '../../../widgets/image_widget.dart';

class InterestedUsersPage extends StatelessWidget {
  final String imageUrl;
  final String? propertyid;

  const InterestedUsersPage({
    Key? key,
    required this.imageUrl,
    required this.propertyid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intrestedUserApiController = Get.put(IntrestedUserApi());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary_color,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          ImageWidget(
            url: imageUrl,
            height: 285.w,
            width: double.infinity,
          ),
          20.ph,
          TextWidget(
            text: 'Interested Users',
            size: 16.sp,
            color: secondary_color,
            textAlign: TextAlign.left,
          ),
          14.ph,
          FutureBuilder(
            future: intrestedUserApiController.fetchApi(propertyid: propertyid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loadingUI();
              } else if (snapshot.hasError) {
                return TextWidget(text: snapshot.error.toString());
              } else if (snapshot.hasData) {
                return snapshot.data.data.length == 0
                    ? const TextWidget(text: 'No Users Found').center()
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return users(snapshot, index);
                        },
                      );
              }
              return const TextWidget(text: "No Data");
            },
          ),
        ],
      ),
    );
  }

  Widget loadingUI() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return LoadingEffect(
            child: Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: ContainerWidget(
            borderadius: 5.r,
            height: 74.h,
          ),
        ));
      },
    );
  }

  Container users(AsyncSnapshot<dynamic> snapshot, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
      alignment: Alignment.center,
      height: 74.h,
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xfff7f7f7),
          borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundImage:
                  NetworkImage(snapshot.data.data[index].interestUserImage)),
          10.pw,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: 'Name:',
                    color: blacktext.withOpacity(0.5),
                    size: 12.sp,
                    textAlign: TextAlign.left,
                  ),
                  5.pw,
                  TextWidget(
                    text: snapshot.data.data[index].name ?? '',
                    color: blacktext.withOpacity(0.5),
                    size: 12.sp,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              2.ph,
              Row(
                children: [
                  TextWidget(
                    text: 'Contact No.',
                    color: blacktext.withOpacity(0.5),
                    size: 12.sp,
                    textAlign: TextAlign.left,
                  ),
                  2.pw,
                  TextWidget(
                    text: snapshot.data.data[index].mobile ?? '',
                    color: blacktext.withOpacity(0.5),
                    size: 12.sp,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              2.ph,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Min -   Rs',
                    color: secondary_color,
                    size: 10.sp,
                  ),
                  100.pw,
                  TextWidget(
                    text: snapshot.data.data[index].entrydt ?? '',
                    color: secondary_color,
                    size: 10.sp,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
