import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/get_fav_properties/get_fav_properties_api.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/widgets/all_property_card.dart';
import 'package:property_app/widgets/appbar.dart';

import '../../../Utils/img_utils.dart';
import '../../../Widgets/text_widget.dart';

class ShortListPage extends StatelessWidget {
  const ShortListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conotroller = Get.put(GetFavPropertiesApi());
    return Scaffold(
      appBar: appbar('', context),
      body: FutureBuilder(
        future: conotroller.fetchApi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator().center();
          } else if (snapshot.hasError) {
            return TextWidget(text: snapshot.error.toString()).center();
          } else if (snapshot.hasData) {
            return snapshot.data.data.length == 0
                ? emptyListView().center()
                : _favPropertiesList(snapshot);
          }
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }

  Widget emptyListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          shortListImage,
          width: 220.w,
          height: 220.h,
        ),
        const TextWidget(
          text: 'You haven’t shortlist any \nproperties yet !',
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _favPropertiesList(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.data.length,
      itemBuilder: (BuildContext context, int index) {
        return AllPropertyCard(
            userdelectedindex: 2,
            snapshot: snapshot,
            index: index,
            propertyTypeId: '');
      },
    );
  }
}
