import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/projects/projects_property.dart';

import '../../../../api_services/projects/project_api.dart';
import '../../../../utils/color_utils.dart';
import '../../../../widgets/projects_card.dart';
import '../../../../widgets/text_widget.dart';

class ProjectsView extends StatelessWidget {
  final int useSelectionInidex;

  const ProjectsView({super.key, required this.useSelectionInidex});
  @override
  Widget build(BuildContext context) {
    return _filteredProperty(useSelectionInidex);
  }

  _filteredProperty(useSelectionInidex) {
    final controller = Get.put(ProjectsApi());
    return FutureBuilder(
      future: controller.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator().center();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return snapshot.data.data.length == 0
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Projects ",
                          color: secondary_color,
                          textAlign: TextAlign.left,
                          size: 17.sp,
                          weight: FontWeight.w600,
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     // Get.to(ViewAllProperty(
                        //     //     userdelectedindex: useSelectionInidex,
                        //     //     propertyTypeId: categoryId)

                        //     //     );
                        //   },
                        //   child: TextWidget(
                        //     text: 'View All',
                        //     color: secondary_color,
                        //     textAlign: TextAlign.left,
                        //     size: 12.sp,
                        //   ),
                        // ),
                      ],
                    ),
                    20.ph,
                    SizedBox(
                      height: 210.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ProjectsPropertiesView(
                                    projectId:
                                        snapshot.data.data[index].projectId,
                                    userdelectedindex: useSelectionInidex,
                                  ));
                            },
                            child: ProjectsCard(
                              snapshot: snapshot,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        }
        return const CircularProgressIndicator().center();
      },
    );
  }
}
