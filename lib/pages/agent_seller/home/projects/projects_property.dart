import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/property_of_projects/projects_properties_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/all_property_card.dart';
import 'package:property_app/widgets/text_widget.dart';

import '../../../../Utils/color_utils.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/image_widget.dart';

class ProjectsPropertiesView extends StatelessWidget {
  final int userdelectedindex;
  final String projectId;
  const ProjectsPropertiesView({
    super.key,
    required this.userdelectedindex,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectsProPertyListApi());
    return Scaffold(
      appBar: appbar("", context),
      body: FutureBuilder(
        future: controller.fetchApi(projectid: projectId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator().center();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            return projectDetails(snapshot);
            //_projectsPropetyList(snapshot);
          }
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }

  Widget projectDetails(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bannerview(snapshot),
            20.ph,
            ImageWidget(
                    isCircle: true,
                    width: 100,
                    height: 100,
                    url:
                        'https://ezzyproperties.com/${snapshot.data.data[0].projectProfile}')
                .center(),
            20.ph,
            TextWidget(
              text: snapshot.data.data[0].projectName,
            ),
            5.ph,
            TextWidget(
              text: snapshot.data.data[0].projectLocation,
              size: 12.sp,
            ),
            5.ph,
            TextWidget(
              text: 'Description',
              size: 12.sp,
            ),
            5.ph,
            TextWidget(
              text: snapshot.data.data[0].projectDescription,
              size: 12.sp,
            ),
            20.ph,
            TextWidget(
              text: 'Amenities',
              size: 12.sp,
            ),
            20.ph,
            Visibility(
              visible: snapshot.data.data[0].propertyKind != 'PLot/Land',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    snapshot.data.data[0].amenities.length,
                    (index) => Column(
                          children: [
                            ClipOval(
                              child: ImageWidget(
                                  width: 50.w,
                                  height: 50.w,
                                  url: snapshot.data.data[0].imageUrl +
                                      snapshot
                                          .data.data[0].amenities[index].icon),
                            ),
                            TextWidget(
                              size: 10.sp,
                              text: snapshot.data.data[0].amenities[index].name,
                              color: secondary_color,
                            )
                          ],
                        )),
              ),
            ),
            20.ph,
            const TextWidget(
              text: 'Properties List',
            ),
            20.ph,
            _projectsPropetyList(snapshot)
          ],
        ),
      ),
    );
  }

  Widget _projectsPropetyList(AsyncSnapshot snapshot) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data.data.length,
      itemBuilder: (BuildContext context, int index) {
        return AllPropertyCard(
            userdelectedindex: userdelectedindex,
            propertyTypeId: '',
            snapshot: snapshot,
            index: index);
      },
    );
  }

  Widget _bannerview(AsyncSnapshot snapshot) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.data.length,
      itemBuilder: (context, index, reelIndex) {
        return ImageWidget(
          url: snapshot.data.data[index].imageUrl +
              snapshot.data.data[index].thumbnailImage,
          height: 100.w,
          width: double.infinity,
        );
      },
      options: CarouselOptions(
        height: 200.w,

        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        // onPageChanged: (index, _) {
        //   slidercontroller.onpageScroll(index);
        // },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
