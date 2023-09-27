import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/property_of_projects/projects_properties_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/all_property_card.dart';
import 'package:property_app/widgets/text_widget.dart';

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
      body: FutureBuilder(
        future: controller.fetchApi(projectid: projectId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator().center();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return _projectsPropetyList(snapshot);
          }
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }

  Widget _projectsPropetyList(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView.builder(
        itemCount: snapshot.data.data.length,
        itemBuilder: (BuildContext context, int index) {
          return AllPropertyCard(
              userdelectedindex: userdelectedindex,
              propertyTypeId: '',
              snapshot: snapshot,
              index: index);
        },
      ),
    );
  }
}
