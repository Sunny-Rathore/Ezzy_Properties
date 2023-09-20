import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/marketing/markenting_intrest.dart';
import 'package:property_app/utils/color_utils.dart';
import 'package:property_app/widgets/button.dart';
import 'package:property_app/widgets/container_widget.dart';

import '../utils/string_utils.dart';
import '../widgets/text_widget.dart';

class ViewMoreView extends StatelessWidget {
  const ViewMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: const Text('Micelle Johnathan'),
            background: Image.network(
              'https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 30, (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.ph,
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
                  TextWidget(
                      size: 12.sp,
                      text:
                          'I am a passionate and innovative architect with a deep love for design and a commitment to transforming spaces into functional works of art. With [X] years of experience in the field, I have had the privilege of working on a diverse range of projects, each one offering unique challenges and opportunities for creative expression.'),
                  20.ph,
                  SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: previuceWork
                            .map((e) => WorkCard(
                                title: e['title'],
                                image: e['image'],
                                onTap: e['onTap']))
                            .toList(),
                      )),
                  20.ph,
                  Button(
                      textcolor: Colors.white,
                      color: secondary_color,
                      text: 'Enquiry',
                      ontap: () {
                        Get.to(() => const MarketingIntrestView());
                      }).center(),
                  20.ph,
                  TextWidget(
                    text: "Reviews",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  )
                ],
              ),
            );
          } else {
            return ListTile(
              // horizontalTitleGap: 20,
              leading: ContainerWidget(
                height: 50.w,
                width: 50.w,
                child: Image.network(
                  'https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg', // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
              title: TextWidget(
                text: 'Ajay',
                size: 15.sp,
              ),
              subtitle: TextWidget(
                text: "innovative architect with a deep love",
                size: 12.sp,
              ),
            );
          }
        }))
      ],
    ));
  }
}

List previuceWork = [
  {
    'title': "Work",
    'image':
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
    'onTap': () {},
  },
  {
    'title': "Work",
    'image':
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
    'onTap': () {},
  },
  {
    'title': "Work",
    'image':
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
    'onTap': () {},
  },
  {
    'title': "Work",
    'image':
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
    'onTap': () {},
  },
  {
    'title': "Work",
    'image':
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
    'onTap': () {},
  },
];

class WorkCard extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  final bool selected;
  const WorkCard(
      {required this.title,
      required this.image,
      required this.onTap,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: ClipRRect(
                child: Image.network(
                  image,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}