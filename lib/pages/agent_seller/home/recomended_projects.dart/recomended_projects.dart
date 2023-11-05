import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/recommended_projects/recommende_projects_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/projects_card.dart';

import '../../../../widgets/text_widget.dart';
import '../projects/projects_property.dart';

class RecomndedProjectsView extends StatelessWidget {
  final int useSelectionInidex;
  const RecomndedProjectsView({super.key, required this.useSelectionInidex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommendedProjectsApi());
    return FutureBuilder(
      future: controller.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator().center();
        } else if (snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString()).center();
        } else if (snapshot.hasData) {
          return _horizontalGridView(snapshot);
        }
        return const CircularProgressIndicator().center();
      },
    );
  }

  Widget _horizontalGridView(AsyncSnapshot snapshot) {
    return SizedBox(
      height: 420.w,
      child: GridView.builder(
        itemCount: snapshot.data.data.length,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Get.to(() => ProjectsPropertiesView(
                      projectId: snapshot.data.data[index].projectId,
                      userdelectedindex: useSelectionInidex,
                    ));
              },
              child: ProjectsCard(snapshot: snapshot, index: index));
        },
      ),
    );
  }
}
