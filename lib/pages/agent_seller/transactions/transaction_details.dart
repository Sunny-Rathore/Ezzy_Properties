import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/transaction_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/container_widget.dart';
import 'package:property_app/widgets/shimmer.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionApiController = Get.put(TransactionApi());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: 'Transaction',
          size: 16.sp,
          color: white_color,
        ),
        backgroundColor: secondary_color,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        children: [
          TextWidget(
            text: 'Transaction Details',
            color: secondary_color,
            size: 20.sp,
            textAlign: TextAlign.left,
          ),
          20.ph,
          FutureBuilder(
            future: transactionApiController.fetchApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return lodinigUI();
              } else if (snapshot.connectionState == ConnectionState.none) {
                return lodinigUI();
              } else if (snapshot.hasError) {
                return TextWidget(text: 'Error:--${snapshot.error.toString()}')
                    .center();
              } else if (snapshot.hasData) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return transactionUi(snapshot, index);
                  },
                );
              }
              return lodinigUI();
            },
          ),
        ],
      ),
    );
  }

  Container transactionUi(AsyncSnapshot<dynamic> snapshot, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      alignment: Alignment.center,
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: white_color,
          border: Border.all(color: const Color(0xffC9C9C9))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: snapshot.data.data[index].name,
                size: 12.sp,
                color: secondary_color,
                textAlign: TextAlign.left,
              ),
              2.ph,
              TextWidget(
                text:
                    'Transaction id #${snapshot.data.data[index].transactionId}',
                size: 10.sp,
                textAlign: TextAlign.left,
                color: const Color(0xFF939393),
              ),
            ],
          ),
          Container(
            width: 77.w,
            height: 19.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: const Color(0xFFE8F8CE)),
            child: TextWidget(
              text: 'Completed',
              size: 10.sp,
              color: secondary_color,
            ),
          )
        ],
      ),
    );
  }

  Widget lodinigUI() {
    return Column(
      children: List.generate(
          9,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: LoadingEffect(
                    child: ContainerWidget(
                  borderadius: 10.r,
                  width: double.infinity,
                  height: 74.w,
                )),
              )),
    );
  }
}
