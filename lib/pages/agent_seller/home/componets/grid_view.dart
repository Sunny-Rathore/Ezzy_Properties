import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/marketing/search_makers.dart';
import 'package:property_app/widgets/container_widget.dart';

import '../../../../utils/img_utils.dart';

class GridBoxView extends StatelessWidget {
  const GridBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    List colorList = [
      const Color(0xFFd0fae2),
      const Color(0xFFf9fad0),
      const Color(0xFFfbe6e5),
    ];
    List<String> imageList = [buildeImage, builingImage, deginerImage];
    List<Widget> textList = [
      Text(
        'Your Trusted Partner in Construction',
        style: GoogleFonts.acme(
            color: const Color(0xFF02b324),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
      ),
      Text(
        'Architectural Visionaries at Your Service',
        style: GoogleFonts.acme(
            color: const Color(0xFFadad12),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
      ),
      Text(
        'Designing Spaces, Creating Memories',
        style: GoogleFonts.acme(
            color: const Color(0xFFdc5708).withOpacity(0.8),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
      ),
    ];
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Wrap(
          children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(
              left: index.isEven ? 0 : 20.w, top: index.isEven ? 0 : 20.w),
          child: GestureDetector(
            onTap: () {
              Get.to(() => const SearchMakers());
            },
            child: _box(
                color: colorList[index],
                image: imageList[index],
                text: textList[index]),
          ),
        ),
      )),
    );
  }

  ContainerWidget _box({color, text, image}) {
    return ContainerWidget(
      bColor: color,
      borderadius: 20.r,
      color: color,
      height: 200.w,
      width: 150.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            20.ph,
            text,
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image(
                  height: 80.w,
                  width: 80.w,
                  fit: BoxFit.fill,
                  image: AssetImage(image)),
            )
          ],
        ),
      ),
    );
  }
}
