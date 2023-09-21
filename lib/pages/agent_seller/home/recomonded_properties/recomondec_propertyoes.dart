import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/pages/agent_seller/home/componets/propeties_card.dart';

import '../../../../api_services/properties/property_list_api.dart';

class RecomendedPropertiesView extends StatelessWidget {
  const RecomendedPropertiesView({super.key});

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
