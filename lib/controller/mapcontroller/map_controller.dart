import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class ShowMapController extends GetxController {
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Future<void> getlatLong(address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        latitude.value = locations.first.latitude;
        longitude.value = locations.first.longitude;
        // Get.to(() => ShowMap(
        //       cityName: snapshot.data.data[0].address,
        //       lat: latitude,
        //       long: longitude,
        //     ));
      } else {
        Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'Error',
            'No location found for the city: $address');
        debugPrint('No location found for the city:  $address');
      }
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }
}
