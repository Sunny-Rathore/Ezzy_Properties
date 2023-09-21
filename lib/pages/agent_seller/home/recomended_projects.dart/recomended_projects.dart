import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/widgets/projects_card.dart';

import '../../../../api_services/properties/property_list_api.dart';

class RecomndedProjectsView extends StatelessWidget {
  const RecomndedProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    return FutureBuilder(
      future: properttyListController.fetchApi(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _horizontalGridView(snapshot);
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
          return ProjectsCard(snapshot: snapshot, index: index);
        },
      ),
    );
  }
}
