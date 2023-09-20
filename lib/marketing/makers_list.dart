// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/makers_api/makers_api.dart';
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
                  child: ImageWidget(url: snapshot.data.data[index].userImage)),
            ),
            title: Text(snapshot.data.data[index].name),
            subtitle: Text(snapshot.data.data[index].email),
          ),
          children: [_expantionItem()],
        );
      },
    );
  }

  Widget _expantionItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150.w,
                width: 150.w,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg"))),
              ),
              10.pw,
              Expanded(
                  child: TextWidget(
                      size: 12.sp,
                      text:
                          'I am a passionate and innovative architect with a deep love for design and a commitment to transforming spaces into functional works of art. With [X] years of experience in the field, I have had the privilege of working on a diverse range of projects, each one offering unique challenges and opportunities for creative expression.'))
            ],
          ),
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
              TextWidget(text: 'Price ${rupees}2000')
            ],
          ),
          5.ph,
          Button(
            text: 'View More',
            ontap: () {
              Get.to(() => const ViewMoreView());
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
