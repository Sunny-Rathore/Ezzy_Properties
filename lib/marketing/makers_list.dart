// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/makers_api/makers_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/marketing/view_more.dart';
import 'package:property_app/utils/color_utils.dart';
import 'package:property_app/utils/string_utils.dart';
import 'package:property_app/widgets/appbar.dart';
import 'package:property_app/widgets/button.dart';
import 'package:property_app/widgets/image_widget.dart';
import 'package:property_app/widgets/text_widget.dart';

class MakersList extends StatelessWidget {
  const MakersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MakersApi());
    return Scaffold(
      appBar: appbar('', context),
      body: FutureBuilder(
        future: controller.fetchApi(type: "Builder"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator().center();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return _makers_list_item(snapshot);
          }
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }

  ListView _makers_list_item(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
              width: 50,
              child: AspectRatio(
                  aspectRatio: 1,
                  child: ImageWidget(url: snapshot.data.data[index].profile)),
            ),
            title: Text(snapshot.data.data[index].username),
            subtitle: Text(
              snapshot.data.data[index].description,
              maxLines: 1,
            ),
          ),
          children: [_expantionItem(snapshot, index: index)],
        );
      },
    );
  }

  Widget _expantionItem(AsyncSnapshot snapshot, {required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Container(
            height: 200.w,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(snapshot.data.data[index].profile))),
          ),
          10.ph,
          TextWidget(size: 12.sp, text: snapshot.data.data[index].description),
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                    5,
                    (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )),
              ),
              TextWidget(
                  text: 'Price ${rupees + snapshot.data.data[index].price}')
            ],
          ),
          5.ph,
          Button(
            text: 'View More',
            ontap: () {
              Get.to(() => ViewMoreView(
                    reviewList: snapshot.data.data[index].reviews,
                    workList: snapshot.data.data[index].workImages,
                    snapshot: snapshot,
                    index: index,
                  ));
            },
            color: secondary_color,
            textcolor: Colors.white,
          ),
          5.ph
        ],
      ),
    );
  }
}
