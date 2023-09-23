import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/projects_card.dart';

import '../../../../api_services/properties/property_list_api.dart';
import '../../../../widgets/text_widget.dart';

class RecomndedProjectsView extends StatelessWidget {
  const RecomndedProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    return FutureBuilder(
      future: properttyListController.fetchApi(),
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
          return ProjectsCard(snapshot: snapshot, index: index);
        },
      ),
    );
  }
}
