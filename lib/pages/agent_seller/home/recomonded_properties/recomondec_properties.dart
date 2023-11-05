import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/home/componets/propeties_card.dart';
import 'package:property_app/widgets/text_widget.dart';

import '../../../../api_services/recommended_properties/recommende_properties_api.dart';

class RecomendedPropertiesView extends StatelessWidget {
  const RecomendedPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommendePropertiesApi());
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
      height: 620.w,
      child: GridView.builder(
        itemCount: snapshot.data.data.length,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return _recommendedPropetiesCard(snapshot, index);
        },
      ),
    );
  }

  Widget _recommendedPropetiesCard(AsyncSnapshot snapshot, int index) {
    return PropertiesCard(
        userSelectionIndex: 2, snapshot: snapshot, index: index);
  }
}
