import 'package:flutter/material.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/agent_seller/details_page/property_details/componets/about_propety.dart';
import 'package:property_app/pages/agent_seller/details_page/property_details/componets/property_photos_videos.dart';

import '../../../Utils/color_utils.dart';
import 'property_details/componets/propertty_enquiry.dart';

class PropertyDetailView extends StatelessWidget {
  final int userSelectionIndex;
  final String propertyId;
  const PropertyDetailView(
      {Key? key, required this.propertyId, required this.userSelectionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondary_color,
        ),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              AboutProperty(
                propertyId: propertyId,
              ),
              38.ph,
              PropertyPhotosVideos(
                propertyId: propertyId,
              ),
              30.ph,
              ProPertyEnquiry(
                userSelectionIndex: userSelectionIndex,
                propertyId: propertyId,
              ),
            ]));
  }
}
