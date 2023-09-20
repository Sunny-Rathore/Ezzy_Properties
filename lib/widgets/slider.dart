import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Controller/slider_controller.dart';

class SliderWidget extends StatelessWidget {
  final double? asspectaaRatio;
  final Widget slideview;
  const SliderWidget({
    Key? key,
    required this.slidercontroller,
    required this.slideview,
    this.asspectaaRatio,
  }) : super(key: key);

  final SliderController slidercontroller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return slideview;
      },
      options: CarouselOptions(
        aspectRatio: asspectaaRatio ?? 3.h / 3.9.h,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        onPageChanged: (index, _) {
          slidercontroller.onpageScroll(index);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
