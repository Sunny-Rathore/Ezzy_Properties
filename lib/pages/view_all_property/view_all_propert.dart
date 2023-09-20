import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_app/widgets/appbar.dart';

import '../../Widgets/container_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../api_services/properties/property_list_api.dart';
import '../../widgets/shimmer.dart';
import '../agent_seller/home/componets/propeties_card.dart';

class ViewAllProperty extends StatelessWidget {
  final int userdelectedindex;
  final String propertyTypeId;
  const ViewAllProperty(
      {super.key,
      required this.userdelectedindex,
      required this.propertyTypeId});

  @override
  Widget build(BuildContext context) {
    final properttyListController = Get.put(ProPertListApi());
    return Scaffold(
      appBar: appbar('All Properties', context),
      body: FutureBuilder(
        future:
            properttyListController.fetchApi(propertytypeid: propertyTypeId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingUi();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.57,
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return PropertiesCard(
                  userSelectionIndex: userdelectedindex,
                  index: index,
                  snapshot: snapshot,
                );
              },
            );
            // ListView.builder(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   shrinkWrap: true,
            //   physics: const BouncingScrollPhysics(),
            //   itemCount: snapshot.data.data.length,
            //   itemBuilder: (context, index) {
            //     return PropertiesCard(
            //       userSelectionIndex: userdelectedindex,
            //       index: index,
            //       snapshot: snapshot,
            //     );
            //   },
            // );
          }
          return loadingUi();
        },
      ),
    );
  }

  Widget loadingUi() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return LoadingEffect(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: ContainerWidget(
              bColor: Colors.grey,
              borderadius: 10.r,
              width: 240.w,
              height: 240.w,
            ),
          ),
        );
      },
    );
  }
}
