import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/notificatios/notificatios_api.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/img_utils.dart';
import '../../../Widgets/text_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsApi());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: 'Notifications',
          size: 16.sp,
          color: white_color,
        ),
        backgroundColor: secondary_color,
      ),
      body: FutureBuilder(
        future: controller.fetchApi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator().center();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                TextWidget(
                  text: 'Today',
                  color: secondary_color,
                  textAlign: TextAlign.left,
                  size: 16.sp,
                ),
                10.ph,
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.w,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data.data.length == 0
                        ? _noNotificatons()
                        : notifcation(snapshot, index);
                  },
                ),
              ],
            );
          }
          return const Text('');
        },
      ),
      //  _noNotificatons()
    );
  }

  Column _noNotificatons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
                image: AssetImage(
                  empty_notification,
                ),
                height: 138.h,
                width: 150.w)
            .center(),
        TextWidget(
          text: 'Opps, there are no notification to \ndisplay ',
          size: 16.sp,
          color: secondary_color,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Row notifcation(AsyncSnapshot snapshot, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: snapshot.data.data[index].replyQuestions ?? '',
                textAlign: TextAlign.left,
                color: blacktext,
                size: 12.sp,
              ),
              5.ph,
              TextWidget(
                text: snapshot.data.data[index].entrydt ?? '',
                textAlign: TextAlign.left,
                color: secondary_color,
                size: 12.sp,
              ),
            ],
          ),
        )
      ],
    );
  }
}
